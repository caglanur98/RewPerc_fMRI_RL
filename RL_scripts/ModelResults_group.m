

% List of subject IDs

subject_ids = {'sub001', 'sub002', 'sub003', 'sub004', 'sub005', 'sub006', 'sub007', 'sub008', ...
    'sub009', 'sub010', 'sub011', 'sub012', 'sub013', 'sub014', 'sub015', 'sub016', ...
    'sub017', 'sub018', 'sub019', 'sub020', 'sub021', 'sub022'};


data_folder = '/Users/caglademirkan/Documents/MATLAB/Model_results';

num_subjects = length(subject_ids);
sumAICs_reward_all = zeros(num_subjects, 3); % Columns for RW, RW2, RWCK
sumAICs_perception_all = zeros(num_subjects, 3); % Columns for RW, RW2, RWCK

for s = 1:num_subjects
    subject_id = subject_ids{s};
    data_filename = fullfile(data_folder, sprintf('Modelparams_%s.mat', subject_id));
    load(data_filename, 'sumAICs_reward', 'sumAICs_perception');

    % Store the loaded values in the matrices
    sumAICs_reward_all(s, :) = sumAICs_reward;
    sumAICs_perception_all(s, :) = sumAICs_perception;
end

% Calculate the mean and SEM for each condition and model
mean_AIC_reward = mean(sumAICs_reward_all);
mean_AIC_perception = mean(sumAICs_perception_all);

sem_AIC_reward = std(sumAICs_reward_all) / sqrt(num_subjects);
sem_AIC_perception = std(sumAICs_perception_all) / sqrt(num_subjects);

% Combine the results into matrices for plotting
mean_AIC = [mean_AIC_reward; mean_AIC_perception];
sem_AIC = [sem_AIC_reward; sem_AIC_perception];




% Group-Level Plot
figure;
hold on;

% Define bar positions and bar width
bar_width = 0.2;
x_reward = [1, 1.3, 1.6]; % x positions for Reward bars (RW, RW2, RWCK)
x_perception = [2.5, 2.8, 3.1]; % x positions for Perception bars (RW, RW2, RWCK)

% Define colors for each model
colors = {'b', 'g', 'r'}; % Assign colors to RW, RW2, and RWCK respectively

% Plot bars for Reward
bars = zeros(3, 1); % To store bar handles for legend
for i = 1:3
    bars(i) = bar(x_reward(i), mean_AIC_reward(i), bar_width, 'FaceColor', colors{i});
    errorbar(x_reward(i), mean_AIC_reward(i), sem_AIC_reward(i), 'k', 'linestyle', 'none');
end

% Plot bars for Perception
for i = 1:3
    bar(x_perception(i), mean_AIC_perception(i), bar_width, 'FaceColor', colors{i});
    errorbar(x_perception(i), mean_AIC_perception(i), sem_AIC_perception(i), 'k', 'linestyle', 'none');
end

% Customize the plot
set(gca, 'XTick', [mean(x_reward), mean(x_perception)]);
set(gca, 'XTickLabel', {'Reward', 'Perception'});
legend(bars, {'RW1', 'RW2', 'RWCK'}, 'Location', 'best'); % Correct legend assignment
xlabel('Condition');
ylabel('Mean AIC');
title('Comparison of AIC Values Across Models and Tasks');
grid on;
hold off;

% Adjust figure window size for better visibility
set(gcf, 'Position', [100, 100, 800, 400]);


%% OTHER PARAMETERS

% List of subject IDs

subject_ids = {'sub001', 'sub002', 'sub003', 'sub004', 'sub005', 'sub006', 'sub007', 'sub008', ...
    'sub009', 'sub010', 'sub011', 'sub012', 'sub013', 'sub014', 'sub015', 'sub016', ...
    'sub017', 'sub018', 'sub019', 'sub020', 'sub021', 'sub022'};


data_folder = '/Users/caglademirkan/Documents/MATLAB/Model_results';

num_subjects = length(subject_ids);

% Initialize matrices for parameters split by task
Reward_Eta_RWCK = zeros(num_subjects, 1);  
Reward_Eta_c_RWCK = zeros(num_subjects, 1);  
Reward_Beta_RWCK = zeros(num_subjects, 1);  
Reward_Beta_c_RWCK = zeros(num_subjects, 1);  


Perception_Eta_RWCK = zeros(num_subjects, 1);  
Perception_Eta_c_RWCK = zeros(num_subjects, 1);  
Perception_Beta_RWCK = zeros(num_subjects, 1);  
Perception_Beta_c_RWCK = zeros(num_subjects, 1);  

for s = 1:num_subjects
    subject_id = subject_ids{s};
    data_filename = fullfile(data_folder, sprintf('Modelparams_%s.mat', subject_id));
    load(data_filename, 'best_Eta_RWCK', 'best_Eta_c_RWCK', 'best_Beta_RWCK', 'best_Beta_c_RWCK');


    if mod(s, 2) == 1  % Odd-numbered subjects: Reward in the first 4 blocks
        Reward_Eta_RWCK(s) = mean(best_Eta_RWCK(1:4));
        Reward_Eta_c_RWCK(s) = mean(best_Eta_c_RWCK(1:4));
        Reward_Beta_RWCK(s) = mean(best_Beta_RWCK(1:4));
        Reward_Beta_c_RWCK(s) = mean(best_Beta_c_RWCK(1:4));

        Perception_Eta_RWCK(s) = mean(best_Eta_RWCK(5:8));
        Perception_Eta_c_RWCK(s) = mean(best_Eta_c_RWCK(5:8));
        Perception_Beta_RWCK(s) = mean(best_Beta_RWCK(5:8));
        Perception_Beta_c_RWCK(s) = mean(best_Beta_c_RWCK(5:8));
    else  % Even-numbered subjects: Perception in the first 4 blocks
        Perception_Eta_RWCK(s) = mean(best_Eta_RWCK(1:4));
        Perception_Eta_c_RWCK(s) = mean(best_Eta_c_RWCK(1:4));
        Perception_Beta_RWCK(s) = mean(best_Beta_RWCK(1:4));
        Perception_Beta_c_RWCK(s) = mean(best_Beta_c_RWCK(1:4));

        Reward_Eta_RWCK(s) = mean(best_Eta_RWCK(5:8));
        Reward_Eta_c_RWCK(s) = mean(best_Eta_c_RWCK(5:8));
        Reward_Beta_RWCK(s) = mean(best_Beta_RWCK(5:8));
        Reward_Beta_c_RWCK(s) = mean(best_Beta_c_RWCK(5:8));
    end
end

% Now compute the overall mean and SEM for each condition
mean_Eta_RWCK_Reward = mean(Reward_Eta_RWCK);
mean_Eta_c_RWCK_Reward = mean(Reward_Eta_c_RWCK);
mean_Beta_RWCK_Reward = mean(Reward_Beta_RWCK);
mean_Beta_c_RWCK_Reward = mean(Reward_Beta_c_RWCK);

mean_Eta_RWCK_Perception = mean(Perception_Eta_RWCK);
mean_Eta_c_RWCK_Perception = mean(Perception_Eta_c_RWCK);
mean_Beta_RWCK_Perception = mean(Perception_Beta_RWCK);
mean_Beta_c_RWCK_Perception = mean(Perception_Beta_c_RWCK);

sem_Eta_RWCK_Reward = std(Reward_Eta_RWCK) / sqrt(num_subjects);
sem_Eta_c_RWCK_Reward = std(Reward_Eta_c_RWCK) / sqrt(num_subjects);
sem_Beta_RWCK_Reward = std(Reward_Beta_RWCK) / sqrt(num_subjects);
sem_Beta_c_RWCK_Reward = std(Reward_Beta_c_RWCK) / sqrt(num_subjects);

sem_Eta_RWCK_Perception = std(Perception_Eta_RWCK) / sqrt(num_subjects);
sem_Eta_c_RWCK_Perception = std(Perception_Eta_c_RWCK) / sqrt(num_subjects);
sem_Beta_RWCK_Perception = std(Perception_Beta_RWCK) / sqrt(num_subjects);
sem_Beta_c_RWCK_Perception = std(Perception_Beta_c_RWCK) / sqrt(num_subjects);



% figure;
% hold on;
% 
% % Define x positions for the two major groups
% x_groups = [1, 2.5];  % Position for Reward and Perception
% 
% % Define bar widths and the spacing between bars within a group
% bar_width = 0.15;
% offset = 0.2;  % Spacing between bars within a group
% 
% % Define colors for each parameter
% param_colors = {'b', 'g', 'r', 'c'}; % Blue for Eta, Green for Eta_c, Red for Beta, Cyan for Beta_c
% 
% % Data for plotting
% reward_values = [mean_Eta_RWCK_Reward, mean_Eta_c_RWCK_Reward, mean_Beta_RWCK_Reward, mean_Beta_c_RWCK_Reward];
% reward_sem = [sem_Eta_RWCK_Reward, sem_Eta_c_RWCK_Reward, sem_Beta_RWCK_Reward, sem_Beta_c_RWCK_Reward];
% 
% perception_values = [mean_Eta_RWCK_Perception, mean_Eta_c_RWCK_Perception, mean_Beta_RWCK_Perception, mean_Beta_c_RWCK_Perception];
% perception_sem = [sem_Eta_RWCK_Perception, sem_Eta_c_RWCK_Perception, sem_Beta_RWCK_Perception, sem_Beta_c_RWCK_Perception];
% 
% % Array to store bar handles for the legend
% bar_handles = zeros(1, 4);
% 
% % Plotting the bars for Reward
% for i = 1:4
%     bar_handles(i) = bar(x_groups(1) + (i-1)*offset, reward_values(i), bar_width, 'FaceColor', param_colors{i});
%     errorbar(x_groups(1) + (i-1)*offset, reward_values(i), reward_sem(i), 'k', 'LineStyle', 'none');
% end
% 
% % Plotting the bars for Perception
% for i = 1:4
%     bar(x_groups(2) + (i-1)*offset, perception_values(i), bar_width, 'FaceColor', param_colors{i});
%     errorbar(x_groups(2) + (i-1)*offset, perception_values(i), perception_sem(i), 'k', 'LineStyle', 'none');
% end
% 
% % Customizing the plot
% set(gca, 'XTick', [mean(x_groups(1) + (0:3)*offset), mean(x_groups(2) + (0:3)*offset)], 'XTickLabel', {'Reward', 'Perception'}, 'FontSize', 12);
% ylabel('Parameter Value', 'FontSize', 14);
% legend(bar_handles, {'Eta', 'Eta_c', 'Beta', 'Beta_c'}, 'Location', 'best');
% title('Parameter Estimates for Reward and Perception Tasks', 'FontSize', 16);
% grid on;
% hold off;
% 
% % Adjust the figure window size for better visibility
% set(gcf, 'Position', [100, 100, 800, 400]);

%% paired t test for parameter estimates (eta, eta_c, beta, beta_c)

% Example for testing Eta_RWCK
[h,p] = ttest(Reward_Eta_RWCK, Perception_Eta_RWCK);
fprintf('Paired t-test for Eta_RWCK: p-value = %.4f\n', p);

[h,p] = ttest(Reward_Eta_c_RWCK, Perception_Eta_c_RWCK);
fprintf('Paired t-test for Eta_c_RWCK: p-value = %.4f\n', p);

[h,p] = ttest(Reward_Beta_RWCK, Perception_Beta_RWCK);
fprintf('Paired t-test for Beta_RWCK: p-value = %.4f\n', p);

[h,p] = ttest(Reward_Beta_c_RWCK, Perception_Beta_c_RWCK);
fprintf('Paired t-test for Beta_c_RWCK: p-value = %.4f\n', p);



%% 2x3 ANOVA for model comparison (mean AIC values)

% Example data preparation
aicData = table(sumAICs_reward_all(:,1), sumAICs_reward_all(:,2), sumAICs_reward_all(:,3), ...
                sumAICs_perception_all(:,1), sumAICs_perception_all(:,2), sumAICs_perception_all(:,3), ...
                'VariableNames', {'Reward_RW1', 'Reward_RW2', 'Reward_RWCK', 'Perception_RW1', 'Perception_RW2', 'Perception_RWCK'});

subjects = (1:num_subjects)';
aicData.SubjectID = subjects;

% Define the design for the within-subject factors
withinDesign = table([1, 2, 3, 1, 2, 3]', [1, 1, 1, 2, 2, 2]', 'VariableNames', {'Model', 'Condition'});
withinDesign.Model = categorical(withinDesign.Model, [1, 2, 3], {'RW1', 'RW2', 'RWCK'});
withinDesign.Condition = categorical(withinDesign.Condition, [1, 2], {'Reward', 'Perception'});

% Fit the repeated measures model
aicModel = fitrm(aicData, 'Reward_RW1,Reward_RW2,Reward_RWCK,Perception_RW1,Perception_RW2,Perception_RWCK ~ 1', 'WithinDesign', withinDesign);

% Run the ANOVA with specified interaction model
aicAnovaResults = ranova(aicModel, 'WithinModel', 'Model*Condition');

disp('Repeated Measures ANOVA for AIC:');
disp(aicAnovaResults);

aicPostHoc = multcompare(aicModel, 'Condition', 'By', 'Model', 'ComparisonType', 'bonferroni');


disp('Post-Hoc Tests for AIC with Bonferroni Correction:');
disp(aicPostHoc);





