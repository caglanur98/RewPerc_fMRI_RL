
%% SUMMARIZING RESULTS ACROSS PARTICIPANTS


subject_ids = {'sub001', 'sub002', 'sub003', 'sub004', 'sub005', 'sub006', 'sub007', 'sub008', ...
               'sub009', 'sub010', 'sub011', 'sub012', 'sub013', 'sub014', 'sub015', 'sub016', ...
               'sub017', 'sub018', 'sub019', 'sub020', 'sub021', 'sub022'};


data_folder = '/Users/caglademirkan/Documents/MATLAB/Behavioral_results';

% Initialize matrices to store data
num_subjects = length(subject_ids);
wide_rt = zeros(num_subjects, 8); % For reaction times
wide_acc = zeros(num_subjects, 8); % For accuracy

for s = 1:num_subjects
    subject_id = subject_ids{s};

    % Load individual subject results
    data_filename = fullfile(data_folder, sprintf('%s_BehavioralResults.mat', subject_id));
    load(data_filename, 'Block_mean_rts', 'Block_mean_accuracies', 'Block_stds', 'Block_rts', 'Block_accuracies');

    % Determine the condition order for the subject
    if mod(s, 2) == 1  % Odd subjects: 1, 3, 5, ... have Reward in blocks 1-4 and Perception in blocks 5-8
        reward_blocks = 1:4;
        perception_blocks = 5:8;
    else  % Even subjects: 2, 4, 6, ... have Perception in blocks 1-4 and Reward in blocks 5-8
        reward_blocks = 5:8;
        perception_blocks = 1:4;
    end

    % Fill wide matrices for RT and accuracy
    for i = 1:4
        wide_rt(s, 2*i-1) = Block_mean_rts(reward_blocks(i)); % Reward
        wide_rt(s, 2*i) = Block_mean_rts(perception_blocks(i)); % Perception
        wide_acc(s, 2*i-1) = Block_mean_accuracies(reward_blocks(i)); % Reward
        wide_acc(s, 2*i) = Block_mean_accuracies(perception_blocks(i)); % Perception
    end
end

% Convert wide matrices to tables for easier manipulation
wide_rt_table = array2table(wide_rt, 'VariableNames', ...
    {'Reward_Block1', 'Perception_Block1', 'Reward_Block2', 'Perception_Block2', ...
    'Reward_Block3', 'Perception_Block3', 'Reward_Block4', 'Perception_Block4'});
wide_rt_table.SubjectID = subject_ids';

wide_acc_table = array2table(wide_acc, 'VariableNames', ...
    {'Reward_Block1', 'Perception_Block1', 'Reward_Block2', 'Perception_Block2', ...
    'Reward_Block3', 'Perception_Block3', 'Reward_Block4', 'Perception_Block4'});
wide_acc_table.SubjectID = subject_ids';





%% Plotting Reaction Times and Accuracy across participants

figure;

subplot(2,2,1);
hold on;
% Calculate mean and standard error for each condition and block
mean_rt_reward = mean(wide_rt(:, [1 3 5 7]));
mean_rt_perception = mean(wide_rt(:, [2 4 6 8]));
sem_rt_reward = std(wide_rt(:, [1 3 5 7])) / sqrt(num_subjects);
sem_rt_perception = std(wide_rt(:, [2 4 6 8])) / sqrt(num_subjects);

% Plot the means with error bars
bar([1:4]-0.15, mean_rt_reward, 0.3, 'FaceColor', 'b', 'DisplayName', 'Reward');
bar([1:4]+0.15, mean_rt_perception, 0.3, 'FaceColor', 'r', 'DisplayName', 'Perception');
errorbar([1:4]-0.15, mean_rt_reward, sem_rt_reward, 'k', 'LineStyle', 'none');
errorbar([1:4]+0.15, mean_rt_perception, sem_rt_perception, 'k', 'LineStyle', 'none');

% Customize the plot
xlabel('Block Number');
ylabel('Mean Reaction Time (s)');
title('RT Across Participants (Reward vs. Perception)');
legend('Location', 'best');
xticks(1:4);
grid on;
hold off;


subplot(2,2,2);
hold on;
% Calculate mean and standard error for each condition and block
mean_acc_reward = mean(wide_acc(:, [1 3 5 7]));
mean_acc_perception = mean(wide_acc(:, [2 4 6 8]));
sem_acc_reward = std(wide_acc(:, [1 3 5 7])) / sqrt(num_subjects);
sem_acc_perception = std(wide_acc(:, [2 4 6 8])) / sqrt(num_subjects);

% Plot the means with error bars
bar([1:4]-0.15, mean_acc_reward, 0.3, 'FaceColor', 'b', 'DisplayName', 'Reward');
bar([1:4]+0.15, mean_acc_perception, 0.3, 'FaceColor', 'r', 'DisplayName', 'Perception');
errorbar([1:4]-0.15, mean_acc_reward, sem_acc_reward, 'k', 'LineStyle', 'none');
errorbar([1:4]+0.15, mean_acc_perception, sem_acc_perception, 'k', 'LineStyle', 'none');

% Customize the plot
xlabel('Block Number');
ylabel('Mean Accuracy (%)');
title('Accuracy Across Participants (Reward vs. Perception)');
legend('Location', 'best');
xticks(1:4);
grid on;
hold off;

%% 2 (Condition: Reward Perception) x 4 (Block number: 1 2 3 4) ANOVA at the group level (N=22)

% % Define the within-subject factors explicitly
% within = table([1 1 2 2 3 3 4 4]', ...
%                [repmat({'Reward'; 'Perception'}, 4, 1)], ...
%                'VariableNames', {'Block', 'Condition'});


% %% Perform 2x4 Repeated Measures ANOVA for Reaction Times
% % Fit the repeated measures model for Reaction Times
% rm_rt = fitrm(wide_rt_table, 'Reward_Block1-Perception_Block4 ~ 1', 'WithinDesign', within);
%
% % Perform ANOVA
% ranova_rt = ranova(rm_rt, 'WithinModel', 'Condition*Block');
%
% % Display results
% disp('Repeated Measures ANOVA for Reaction Times:');
% disp(ranova_rt);
%
% %% Perform 2x4 Repeated Measures ANOVA for Accuracy
% % Fit the repeated measures model for Accuracy
% rm_acc = fitrm(wide_acc_table, 'Reward_Block1-Perception_Block4 ~ 1', 'WithinDesign', within);
%
% % Perform ANOVA
% ranova_acc = ranova(rm_acc, 'WithinModel', 'Condition*Block');
%
% % Display results
% disp('Repeated Measures ANOVA for Accuracy:');
% disp(ranova_acc);
%

