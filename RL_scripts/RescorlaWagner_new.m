
%% Rescorla-Wagner Model with two learning rates (Eta_1 for reward/ Eta_2 for no reward)

function [PE_regressor_RW2, best_Eta_1_RW2, best_Eta_2_RW2, best_Beta_RW2, max_loglikelihood_RW2, AIC_RW2] = RescorlaWagner_new(stimuli_code, button_presses, response_accuracy, plot_flag);


%% Define learning rate and softmax temperature

Eta_1_RW2= 0: 0.1: 1;  % learning rate for reward
Eta_2_RW2 = 0: 0.1: 1; % learning rate for no reward
Beta_RW2 = 0: 0.1: 5;

%% Initialize arrays for log likelihood and prediction errors

for i = 1: length(Eta_1_RW2)
    for k = 1: length (Eta_2_RW2)
        for j= 1: length(Beta_RW2)

            logLik = 0;
            PEs = zeros(1, length(button_presses)); % To store prediction error
            V = zeros(1, length(unique(stimuli_code))); % Initial values for the 10 stimuli, indicating no prior knowledge


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

                    if reward==1
                        % Update value estimate for the chosen stimulus
                        V(chosenStimulus) = V(chosenStimulus) + Eta_1_RW2 (i) * PE;

                    else
                        V(chosenStimulus) = V(chosenStimulus) + Eta_2_RW2 (k) * PE;

                    end

                    %% Softmax Decision Rule

                    % Calculate the probability of choosing each option for the current trial
                    expValues = exp(Beta_RW2 (j) * V(stimuli_code(t,:))); % Exponentiated value estimates for available options
                    probabilities = expValues / sum(expValues); % Probability of choosing each option

                    %% Update Log Likelihood

                    % Find the probability of the chosen option
                    chosenProb = probabilities(chosenStimulus == stimuli_code(t,:));
                    logLik = logLik + log(chosenProb); % Add the log probability of the chosen option
                    likelihood (i,k,j)= exp (logLik);
                end
            end
            all_PEs {i,k,j} = PEs;
        end
    end
end


marginal_Beta_RW2= sum(sum (likelihood,1),2);
best_Beta_RW2 = Beta_RW2(find(marginal_Beta_RW2==max(marginal_Beta_RW2)));

marginal_Eta_1_RW2= sum(sum (likelihood,2),3);
best_Eta_1_RW2 = Eta_1_RW2(find(marginal_Eta_1_RW2==max(marginal_Eta_1_RW2)));

marginal_Eta_2_RW2= sum(sum (likelihood,1),3);
best_Eta_2_RW2 = Eta_2_RW2(find(marginal_Eta_2_RW2==max(marginal_Eta_2_RW2)));

PE_regressor_RW2 = all_PEs{find(marginal_Eta_1_RW2==max(marginal_Eta_1_RW2)), find(marginal_Eta_2_RW2==max(marginal_Eta_2_RW2)), find(marginal_Beta_RW2==max(marginal_Beta_RW2))};

max_loglikelihood_RW2 = log(likelihood(find(marginal_Eta_1_RW2==max(marginal_Eta_1_RW2)), find(marginal_Eta_2_RW2==max(marginal_Eta_2_RW2)), find(marginal_Beta_RW2==max(marginal_Beta_RW2))));


%% Model comparison

np = 3; % number of parameters
AIC_RW2 = -2*max_loglikelihood_RW2 + 2*np;

