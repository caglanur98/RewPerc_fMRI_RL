%% SUMMARIZING RESULTS ACROSS PARTICIPANTS


subject_ids = {'sub001', 'sub002', 'sub003', 'sub004', 'sub005', 'sub006', 'sub007', 'sub008', ...
               'sub009', 'sub010', 'sub011', 'sub012', 'sub013', 'sub014', 'sub015', 'sub016', ...
               'sub017', 'sub018', 'sub019', 'sub020', 'sub021', 'sub022'};


data_folder = '/Users/caglademirkan/Documents/MATLAB/Merged_behavioral_results';

% Initialize matrices to store data
num_subjects = length(subject_ids);
reward_rt = zeros(num_subjects, 2); % For Reward RTs: First Half, Second Half
perception_rt = zeros(num_subjects, 2); % For Perception RTs: First Half, Second Half
reward_acc = zeros(num_subjects, 2); % For Reward Accuracies: First Half, Second Half
perception_acc = zeros(num_subjects, 2); % For Perception Accuracies: First Half, Second Half

for s = 1:num_subjects
    subject_id = subject_ids{s};

    % Load individual subject results
    data_filename = fullfile(data_folder, sprintf('%s_Merged_BehavioralResults.mat', subject_id));
    load(data_filename, 'mean_first_half_reward_rt', 'mean_second_half_reward_rt', ...
         'mean_first_half_reward_accuracy', 'mean_second_half_reward_accuracy', ...
         'mean_first_half_perception_rt', 'mean_second_half_perception_rt', ...
         'mean_first_half_perception_accuracy', 'mean_second_half_perception_accuracy');

    % Store data in matrices
    reward_rt(s, :) = [mean_first_half_reward_rt, mean_second_half_reward_rt];
    perception_rt(s, :) = [mean_first_half_perception_rt, mean_second_half_perception_rt];
    reward_acc(s, :) = [mean_first_half_reward_accuracy, mean_second_half_reward_accuracy];
    perception_acc(s, :) = [mean_first_half_perception_accuracy, mean_second_half_perception_accuracy];
end


%% PLOTTING RT AND ACCURACY ACROSS PARICIPANTS

figure;

% Reaction Times
subplot(2, 1, 1);
hold on;
mean_rt_reward = mean(reward_rt);
sem_rt_reward = std(reward_rt) / sqrt(num_subjects);
mean_rt_perception = mean(perception_rt);
sem_rt_perception = std(perception_rt) / sqrt(num_subjects);

bar([1, 2]-0.15, mean_rt_reward, 0.3, 'FaceColor', 'b');
bar([1, 2]+0.15, mean_rt_perception, 0.3, 'FaceColor', 'r');
errorbar([1, 2]-0.15, mean_rt_reward, sem_rt_reward, 'k', 'LineStyle', 'none');
errorbar([1, 2]+0.15, mean_rt_perception, sem_rt_perception, 'k', 'LineStyle', 'none');
xlabel('Phase');
ylabel('Mean Reaction Time (s)');
legend({'Reward', 'Perception'}, 'Location', 'best');
title(' Reaction Times across participants');
xticks([1, 2]);
xticklabels({'First Half', 'Second Half'});
grid on;

% Accuracy
subplot(2, 1, 2);
hold on;
mean_acc_reward = mean(reward_acc);
sem_acc_reward = std(reward_acc) / sqrt(num_subjects);
mean_acc_perception = mean(perception_acc);
sem_acc_perception = std(perception_acc) / sqrt(num_subjects);

bar([1, 2]-0.15, mean_acc_reward * 100, 0.3, 'FaceColor', 'b');
bar([1, 2]+0.15, mean_acc_perception * 100, 0.3, 'FaceColor', 'r');
errorbar([1, 2]-0.15, mean_acc_reward * 100, sem_acc_reward * 100, 'k', 'LineStyle', 'none');
errorbar([1, 2]+0.15, mean_acc_perception * 100, sem_acc_perception * 100, 'k', 'LineStyle', 'none');
xlabel('Phase');
ylabel('Mean Accuracy (%)');
title('Accuracy across participants');
xticks([1, 2]);
xticklabels({'First Half', 'Second Half'});
grid on;
hold off;

% Save the plot
saveas(gcf, 'Merged_Reduced_BehavioralResults_group.png');



%% 2X2 REPEATED MEASURES ANOVA

% Prepare Data, create tables for RT and ACC

rtData = table(reward_rt(:,1), reward_rt(:,2), perception_rt(:,1), perception_rt(:,2), ...
                'VariableNames', {'Reward_First', 'Reward_Second', 'Perception_First', 'Perception_Second'});
accData = table(reward_acc(:,1), reward_acc(:,2), perception_acc(:,1), perception_acc(:,2), ...
                'VariableNames', {'Reward_First', 'Reward_Second', 'Perception_First', 'Perception_Second'});


subjects = (1:num_subjects)';
rtData.SubjectID = subjects;
accData.SubjectID = subjects;


% Define within-subject factors

withinDesign = table([1, 2, 1, 2]', [1, 1, 2, 2]', 'VariableNames', {'Phase', 'Condition'});
withinDesign.Phase = categorical(withinDesign.Phase, [1, 2], {'First', 'Second'});
withinDesign.Condition = categorical(withinDesign.Condition, [1, 2], {'Reward', 'Perception'});

% Fit Repeated Measures Models

rtModel = fitrm(rtData, 'Reward_First,Reward_Second,Perception_First,Perception_Second ~ 1', 'WithinDesign', withinDesign);
accModel = fitrm(accData, 'Reward_First,Reward_Second,Perception_First,Perception_Second ~ 1', 'WithinDesign', withinDesign);

% Run the ANOVA for each model with specified interaction model 

rtAnovaResults = ranova(rtModel, 'WithinModel', 'Phase*Condition');
accAnovaResults = ranova(accModel, 'WithinModel', 'Phase*Condition');


% Calculate Partial Eta Squared
effectNames = rtAnovaResults.Properties.RowNames(contains(rtAnovaResults.Properties.RowNames, 'Error'), :);
etaSquaredRT = rtAnovaResults.SumSq(1:height(rtAnovaResults)/2) ./ ...
              (rtAnovaResults.SumSq(1:height(rtAnovaResults)/2) + rtAnovaResults.SumSq(contains(rtAnovaResults.Properties.RowNames, 'Error')));
etaSquaredACC = accAnovaResults.SumSq(1:height(accAnovaResults)/2) ./ ...
              (accAnovaResults.SumSq(1:height(accAnovaResults)/2) + accAnovaResults.SumSq(contains(accAnovaResults.Properties.RowNames, 'Error')));

% Append Eta Squared to ANOVA Results Tables

rtAnovaResults.etaSquared = [etaSquaredRT; nan(height(rtAnovaResults)/2, 1)]; % Append NaN for error rows
rtAnovaResults = rtAnovaResults(:, {'SumSq', 'DF', 'MeanSq', 'F',  'pValue','etaSquared', 'pValueGG', 'pValueHF', 'pValueLB'});

accAnovaResults.etaSquared = [etaSquaredACC; nan(height(accAnovaResults)/2, 1)]; % Append NaN for error rows
accAnovaResults = accAnovaResults(:, {'SumSq', 'DF', 'MeanSq', 'F',  'pValue', 'etaSquared','pValueGG', 'pValueHF', 'pValueLB'});


% Display and save the ANOVA results

disp('Repeated Measures ANOVA for Reaction Times:');
disp(rtAnovaResults);
disp('Repeated Measures ANOVA for Accuracy:');
disp(accAnovaResults);

% Save the results
save('ANOVAresults.mat', 'rtData', 'accData', 'rtModel', 'accModel', 'rtAnovaResults', 'accAnovaResults', 'withinDesign', 'etaSquaredRT', 'etaSquaredACC');


% Create a table of descriptive statistics
descriptiveStats = table([mean_rt_reward(1); mean_rt_reward(2); mean_rt_perception(1); mean_rt_perception(2)], ...
                         [sem_rt_reward(1); sem_rt_reward(2); sem_rt_perception(1); sem_rt_perception(2)], ...
                         [mean_acc_reward(1); mean_acc_reward(2); mean_acc_perception(1); mean_acc_perception(2)], ...
                         [sem_acc_reward(1); sem_acc_reward(2); sem_acc_perception(1); sem_acc_perception(2)], ...
                         'VariableNames', {'Mean_RT', 'SEM_RT', 'Mean_Acc', 'SEM_Acc'}, ...
                         'RowNames', {'Reward First', 'Reward Second', 'Perception First', 'Perception Second'});
disp(descriptiveStats);

% % Save the table as a CSV file
% writetable(descriptiveStats, 'Descriptive_Statistics.csv', 'WriteRowNames', true);





%% PLOTTING INTERACTION EFFECTS ON ACCURACY
means = [mean_acc_reward(1), mean_acc_reward(2); mean_acc_perception(1), mean_acc_perception(2)];
sems = [sem_acc_reward(1), sem_acc_reward(2); sem_acc_perception(1), sem_acc_perception(2)];

% Creating the interaction plot
figure;
hold on;

% Define x positions for each group to center them
x_reward = [1, 2];
x_perception = [1, 2];

% Error bars and main data points
errorbar(x_reward, means(1,:), sems(1,:), 'b-o', 'LineWidth', 2, 'MarkerSize', 10, 'MarkerFaceColor', 'b'); % Reward
errorbar(x_perception, means(2,:), sems(2,:), 'r-o', 'LineWidth', 2, 'MarkerSize', 10, 'MarkerFaceColor', 'r'); % Perception

% Improve the aesthetics
set(gca, 'XTick', [1, 2], 'XTickLabel', {'First Half', 'Second Half'}, 'FontSize', 12);
xlim([0.75 2.25]); % Adjust the limits to ensure the labels are centered
xlabel('Phase', 'FontSize', 14);
ylabel('Mean Accuracy', 'FontSize', 14);
legend({'Reward', 'Perception'}, 'Location', 'best');
title('Interaction of Condition and Phase on Accuracy', 'FontSize', 16);
grid on;
hold off;

saveas(gcf, 'Accuracy_Interaction_Plot.png');

%% POSTHOC TEST - BONFERRONI CORRECTION


rtPostHoc = multcompare(rtModel, 'Condition', 'By', 'Phase', 'ComparisonType', 'bonferroni');
accPostHoc = multcompare(accModel, 'Condition', 'By', 'Phase', 'ComparisonType', 'bonferroni');

disp('Post-Hoc Tests for Reaction Times with Bonferroni Correction:');
disp(rtPostHoc);
disp('Post-Hoc Tests for Accuracy with Bonferroni Correction:');
disp(accPostHoc);

% Optionally, save the post-hoc results
save('PostHocResults.mat', 'rtPostHoc', 'accPostHoc');