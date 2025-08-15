
%% Rescorla-Wagner Model for 3-Armed Bandit Task

function [PE_regressor_RW, best_Eta_RW, best_Beta_RW, max_loglikelihood_RW, AIC_RW] = RescorlaWagnermodel_updated(stimuli_code, button_presses, response_accuracy, plot_flag);


%% Define learning rate and softmax temperature

Eta_RW = 0: 0.1: 1; % Learning rate, controls how much we update our value estimates based on the prediction error
Beta_RW = 0: 0.1: 5; % Inverse temperature parameter for softmax decision rule


%% Initialize arrays for log likelihood and prediction errors

for i = 1: length(Eta_RW)
    for j= 1: length(Beta_RW)

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
    
                % Update value estimate for the chosen stimulus
                V(chosenStimulus) = V(chosenStimulus) + Eta_RW (i) * PE;
    
                %% Softmax Decision Rule
              
                % Calculate the probability of choosing each option for the current trial
                expValues = exp(Beta_RW (j) * V(stimuli_code(t,:))); % Exponentiated value estimates for available options
                probabilities = expValues / sum(expValues); % Probability of choosing each option
    
                %% Update Log Likelihood

                % Find the probability of the chosen option
                chosenProb = probabilities(chosenStimulus == stimuli_code(t,:));
                logLik = logLik + log(chosenProb); % Add the log probability of the chosen option
                likelihood (i,j)= exp (logLik);
            end
        end
        all_PEs {i,j} = PEs;
    end
end

marginal_Beta_RW = sum (likelihood,1);
best_Beta_RW = Beta_RW(find(marginal_Beta_RW==max(marginal_Beta_RW)));

marginal_Eta_RW= sum (likelihood,2);
best_Eta_RW = Eta_RW(find(marginal_Eta_RW==max(marginal_Eta_RW)));

PE_regressor_RW =all_PEs{find(marginal_Eta_RW==max(marginal_Eta_RW)), find(marginal_Beta_RW==max(marginal_Beta_RW))};

max_loglikelihood_RW = log(likelihood(find(marginal_Eta_RW==max(marginal_Eta_RW)),find(marginal_Beta_RW==max(marginal_Beta_RW))));

%% Model comparison

np = 2; % number of parameters
AIC_RW = -2*max_loglikelihood_RW + 2*np;


% if plot_flag == 1
% 
%     figure; 
%     subplot(2,1,1)
%     imagesc (Beta, Eta, likelihood)
%     xlabel ('Beta')
%     ylabel ('Eta')
%     title(strcat('Eta = ', num2str(best_eta),'; Beta=', num2str(best_beta)));
% 
%     subplot(2,1,2)
%     plot( PE_regressor)
%     xlabel ('trial')
%     title ('PE')
% 
% end
