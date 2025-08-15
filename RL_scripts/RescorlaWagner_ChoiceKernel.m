
%% Rescorla Wagner Model with Choice Kernel for perseveration

function [PE_regressor_RWCK, best_Beta_RWCK, best_Beta_c_RWCK, best_Eta_RWCK, best_Eta_c_RWCK, max_loglikelihood_RWCK, AIC_RWCK] = RescorlaWagner_ChoiceKernel(stimuli_code, button_presses, response_accuracy, plot_flag)


%% Define learning rate and softmax temperature

Eta_RWCK = 0: 0.1: 1;
Eta_c_RWCK = 0:0.1:2; % choice kernel
Beta_RWCK = 0: 0.1: 5;
Beta_c_RWCK = 0:0.1:30; % choice kernel


%% Initialize arrays for log likelihood and prediction errors

for i = 1:length(Eta_RWCK)
    for k = 1:length(Eta_c_RWCK)
    for j = 1:length(Beta_RWCK)
            for l = 1:length(Beta_c_RWCK)

                logLik = 0;
                PEs = zeros(1, length(button_presses)); % To store prediction error
                V = zeros(1, length(unique(stimuli_code))); % Initial values for the 10 stimuli, indicating no prior knowledge
                C = zeros(1, length(unique(stimuli_code))); % Choice kernel

                %% Loop over each trial to update value estimates, calculate softmax probabilities, and update log likelihood

                for t = 1:length(button_presses)

                    if isnan(button_presses(t))
                        PEs(t) = NaN;
                    else
                        chosenIndex = button_presses(t); % Index of the chosen option for trial t
                        chosenStimulus = stimuli_code(t, chosenIndex); % ID of the stimulus chosen

                        reward = response_accuracy(t); % Outcome of the choice

                        % Calculate prediction error for the chosen stimulus
                        PE = reward - V(chosenStimulus);
                        PEs(t) = PE;  % Store the prediction error

                        % Update value estimate for the chosen stimulus
                        V(chosenStimulus) = V(chosenStimulus) + Eta_RWCK (i) * PE;

                        % Update Choice Kernel
                        C = C * (1 - Eta_c_RWCK(k)); % Decay previous choices
                        C(chosenStimulus) = C(chosenStimulus) + Eta_c_RWCK(k); % Reinforce current choice

                        %% Softmax Decision Rule with Choice Kernel

                        expValues = exp(Beta_RWCK(j) * V(stimuli_code(t,:)) + Beta_c_RWCK(l) * C(stimuli_code(t,:)));
                        probabilities = expValues / sum(expValues);

                        % Update Log Likelihood
                        chosenProb = probabilities(chosenStimulus == stimuli_code(t,:));
                        logLik = logLik + log(chosenProb);
                        likelihood(i,k,j,l) = exp(logLik);


                    end
                end
                all_PEs {i,k,j,l} = PEs;

            end
        end
    end
end


marginal_Beta_RWCK= sum(sum(sum (likelihood,1),2),4);
best_Beta_RWCK = Beta_RWCK(find(marginal_Beta_RWCK==max(marginal_Beta_RWCK)));

marginal_Beta_c_RWCK= sum(sum(sum (likelihood,1),2),3);
best_Beta_c_RWCK = Beta_c_RWCK(find(marginal_Beta_c_RWCK==max(marginal_Beta_c_RWCK)));

marginal_Eta_RWCK= sum(sum(sum (likelihood,2),3),4);
best_Eta_RWCK = Eta_RWCK(find(marginal_Eta_RWCK==max(marginal_Eta_RWCK)));

marginal_Eta_c_RWCK= sum(sum(sum (likelihood,1),3),4);
best_Eta_c_RWCK = Eta_c_RWCK(find(marginal_Eta_c_RWCK==max(marginal_Eta_c_RWCK)));

PE_regressor_RWCK = all_PEs{find(marginal_Eta_RWCK==max(marginal_Eta_RWCK)),find(marginal_Eta_c_RWCK==max(marginal_Eta_c_RWCK)), find(marginal_Beta_RWCK==max(marginal_Beta_RWCK)), find(marginal_Beta_c_RWCK==max(marginal_Beta_c_RWCK))};

max_loglikelihood_RWCK = log(likelihood(find(marginal_Eta_RWCK==max(marginal_Eta_RWCK)),find(marginal_Eta_c_RWCK==max(marginal_Eta_c_RWCK)), find(marginal_Beta_RWCK==max(marginal_Beta_RWCK)), find(marginal_Beta_c_RWCK==max(marginal_Beta_c_RWCK))));

%% Model comparison

np = 4; % number of parameters
AIC_RWCK = -2*max_loglikelihood_RWCK + 2*np;