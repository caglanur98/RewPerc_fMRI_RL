%% Import data from text file

filename= '/Users/caglademirkan/Documents/MATLAB/reduced_behavioral_data/sub008_1204_reduced.csv'



%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 155);

% Specify range and delimiter
opts.DataLines = [2, Inf];
opts.Delimiter = ";";

% Specify column names and types
opts.VariableNames = ["conditionBlock", "instImg", "instText", "blockImg", "stim1", "stim2", "stim3", "stim1prob", "stim2prob", "stim3prob", "normProb1", "normProb2", "normProb3", "corrAns1", "corrAns2", "corrAns3", "oldAlien", "oldAlienIndex", "newAlien", "newAlienIndex", "sentence", "conditionsthisRepN", "conditionsthisTrialN", "conditionsthisN", "conditionsthisIndex", "trialsthisRepN", "trialsthisTrialN", "trialsthisN", "trialsthisIndex", "image_3started", "image_3stopped", "key_respkeys", "key_resprt", "key_respstarted", "key_respstopped", "key_resp_nextkeys", "key_resp_nextrt", "key_resp_nextstarted", "key_resp_nextstopped", "ConditionStart1fmri", "image_2started", "image_2stopped", "block_Inststarted", "block_Inststopped", "space_for_nextkeys", "space_for_nextrt", "space_for_nextstarted", "space_for_nextstopped", "BlockStart1fmri", "textstarted", "textstopped", "jitter1_durationfmri", "jitter1_startfmri", "jitter1_stopfmri", "text_3started", "text_3stopped", "TrialStartfmri", "blockImagestarted", "blockImagestopped", "stimLeftstarted", "stimLeftstopped", "stimCenterstarted", "stimCenterstopped", "stimRightstarted", "stimRightstopped", "progressFeedbackstarted", "progressFeedbackstopped", "progressFeedback_textstarted", "progressFeedback_textstopped", "key_responsekeys", "key_responsestarted", "key_responsestopped", "reward_Tot", "current_condition", "correct_answer", "inst_key_pressed", "Respondfmri", "blockImage_3started", "blockImage_3stopped", "stimLeft_3started", "stimLeft_3stopped", "stimCenter_3started", "stimCenter_3stopped", "stimRight_3started", "stimRight_3stopped", "partChoicestarted", "partChoicestopped", "particYourChoicestarted", "particYourChoicestopped", "progresssFeedback_2started", "progresssFeedback_2stopped", "progressFeedback_text_2started", "progressFeedback_text_2stopped", "bgstarted", "bgstopped", "image_leftstarted", "image_leftstopped", "image_rightstarted", "image_rightstopped", "image_centerstarted", "image_centerstopped", "text_6started", "text_6stopped", "jitter2_durationfmri", "jitter2_startfmri", "jitter2_stopfmri", "text_4started", "text_4stopped", "feedbackStartfmri", "feedbackStopfmri", "blockImage_2started", "blockImage_2stopped", "stimLeft_2started", "stimLeft_2stopped", "stimCenter_2started", "stimCenter_2stopped", "stimRight_2started", "stimRight_2stopped", "partChoice_2started", "partChoice_2stopped", "particYourChoice_2started", "particYourChoice_2stopped", "pointFeedbackstarted", "pointFeedbackstopped", "pointFeedback_textstarted", "pointFeedback_textstopped", "progressFeedback_3started", "progressFeedback_3stopped", "progressFeedback_text_3started", "progressFeedback_text_3stopped", "participant_block_accuracy", "BlockfeedbackStartfmri", "block_feedbackMsgstarted", "block_feedbackMsgstopped", "BlockfeedbackStopfmri", "key_responsert", "BlockStart2fmri", "BlockStart3fmri", "BlockStart4fmri", "participant_condition_accuracy", "condition_feedbackAccuracystarted", "condition_feedbackAccuracystopped", "ConditionStart0fmri", "participant_block_bonus", "participant_condition_bonus", "endExperimentfmri", "text_5started", "text_5stopped", "participant", "session", "date", "expName", "psychopyVersion", "frameRate", "VarName155"];
opts.VariableTypes = ["double", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "double", "double", "double", "double", "double", "double", "categorical", "categorical", "categorical", "categorical", "double", "categorical", "double", "categorical", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "string", "double", "double", "double", "string", "double", "double", "string", "double", "categorical", "categorical", "double", "double", "categorical", "double", "categorical", "categorical", "double", "double", "double", "double", "categorical", "double", "double", "categorical", "double", "categorical", "double", "categorical", "double", "categorical", "double", "categorical", "double", "categorical", "double", "double", "categorical", "double", "double", "double", "double", "double", "double", "categorical", "double", "categorical", "double", "categorical", "double", "categorical", "double", "categorical", "double", "categorical", "double", "categorical", "double", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "double", "double", "double", "double", "categorical", "double", "double", "double", "categorical", "double", "categorical", "double", "categorical", "double", "categorical", "double", "categorical", "double", "categorical", "double", "categorical", "double", "categorical", "double", "categorical", "double", "categorical", "double", "double", "double", "categorical", "double", "double", "double", "double", "double", "double", "double", "string", "double", "double", "double", "double", "double", "double", "categorical", "double", "categorical", "categorical", "categorical", "double", "string"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, ["key_respstopped", "key_resp_nextstopped", "image_2stopped", "condition_feedbackAccuracystopped", "VarName155"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["instImg", "instText", "blockImg", "stim1", "stim2", "stim3", "corrAns1", "corrAns2", "corrAns3", "oldAlien", "newAlien", "sentence", "key_respstopped", "key_resp_nextstopped", "image_2stopped", "block_Inststopped", "space_for_nextkeys", "space_for_nextstopped", "textstarted", "textstopped", "text_3stopped", "blockImagestopped", "stimLeftstopped", "stimCenterstopped", "stimRightstopped", "progressFeedbackstopped", "progressFeedback_textstopped", "key_responsestopped", "blockImage_3stopped", "stimLeft_3stopped", "stimCenter_3stopped", "stimRight_3stopped", "partChoicestopped", "particYourChoicestopped", "progresssFeedback_2stopped", "progressFeedback_text_2stopped", "bgstarted", "bgstopped", "image_leftstarted", "image_leftstopped", "image_rightstarted", "image_rightstopped", "image_centerstarted", "image_centerstopped", "text_6started", "text_6stopped", "text_4stopped", "blockImage_2stopped", "stimLeft_2stopped", "stimCenter_2stopped", "stimRight_2stopped", "partChoice_2stopped", "particYourChoice_2stopped", "pointFeedbackstopped", "pointFeedback_textstopped", "progressFeedback_3stopped", "progressFeedback_text_3stopped", "block_feedbackMsgstopped", "condition_feedbackAccuracystopped", "participant", "date", "expName", "psychopyVersion", "VarName155"], "EmptyFieldRule", "auto");
opts = setvaropts(opts, ["image_3stopped", "text_5stopped"], "TrimNonNumeric", true);
opts = setvaropts(opts, ["image_3stopped", "text_5stopped"], "ThousandsSeparator", ",");

% Import the data
beh_log = readtable(filename, opts);

%% Clear temporary variables
clear opts

%% Extract useful columns

fmri_block_onsets = [];
for i=1:4 % for each of the 4 repetitions of a condition
    eval(strcat('fmri_block_onsets = [fmri_block_onsets; find(~isnan(beh_log.BlockStart',num2str(i),'fmri))];'));
end
fmri_block_onsets = sort(fmri_block_onsets);

all_reaction_times = [];
all_response_accuracies = [];

Block_rts = cell(8, 1);
Block_accuracies = cell(8, 1);

for i=1:length(fmri_block_onsets)

    if i < length(fmri_block_onsets)

        scene_onsets = beh_log(fmri_block_onsets(i):fmri_block_onsets(i+1)-1,:).TrialStartfmri;
        response_onsets = beh_log(fmri_block_onsets(i):fmri_block_onsets(i+1)-1,:).Respondfmri;
        response_accuracy = beh_log(fmri_block_onsets(i):fmri_block_onsets(i+1)-1,:).correct_answer;

    else

        scene_onsets = beh_log(fmri_block_onsets(i):end-1,:).TrialStartfmri;
        response_onsets = beh_log(fmri_block_onsets(i):end-1,:).Respondfmri;
        response_accuracy = beh_log(fmri_block_onsets(i):end-1,:).correct_answer;

    end


    if length(isnan(scene_onsets))>0
        response_accuracy(find(isnan(scene_onsets))) = [];
        response_onsets(find(isnan(scene_onsets))) = [];
        scene_onsets(find(isnan(scene_onsets))) = [];
    end

     % Calculate Reaction Times (RT)
    reaction_times = response_onsets - scene_onsets;

    % Store all RTs and response accuracies for this block
    all_reaction_times = [all_reaction_times; reaction_times(find(response_accuracy >= 0))];
    all_response_accuracies = [all_response_accuracies; response_accuracy(find(response_accuracy >= 0))];

    Block_rts{i} = reaction_times(response_accuracy >= 0);
    Block_accuracies{i} = response_accuracy(response_accuracy >= 0);


    names = {'scene_onsets', 'response_onsets', 'response_accuracy', 'reaction_times'};
    onsets = {scene_onsets(find(response_accuracy >= 0)), response_onsets(find(response_accuracy >= 0)), response_accuracy(find(response_accuracy >= 0)), reaction_times(find(response_accuracy >= 0))};

    filename = strcat('sub008_reduced_block', num2str(i), 'conditions.mat');
    save(filename, 'names', 'onsets');

end


%% Merged blocks for interpretation


% Reward Condition 

first_half_reward_accuracy = [Block_accuracies{5}; Block_accuracies{6}];
first_half_reward_rt = [Block_rts{5}; Block_rts{6}];

second_half_reward_accuracy = [Block_accuracies{7}; Block_accuracies{8}];
second_half_reward_rt = [Block_rts{7}; Block_rts{8}];

% Perception Condition 

first_half_perception_accuracy = [Block_accuracies{1}; Block_accuracies{2}];
first_half_perception_rt = [Block_rts{1}; Block_rts{2}];

second_half_perception_accuracy = [Block_accuracies{3}; Block_accuracies{4}];
second_half_perception_rt = [Block_rts{3}; Block_rts{4}];

% Calculate Mean and Standard Deviation for Accuracies and RTs

mean_first_half_reward_accuracy = mean(first_half_reward_accuracy);
sd_first_half_reward_accuracy = std(first_half_reward_accuracy);
mean_second_half_reward_accuracy = mean(second_half_reward_accuracy);
sd_second_half_reward_accuracy = std(second_half_reward_accuracy);

mean_first_half_reward_rt = mean(first_half_reward_rt);
sd_first_half_reward_rt = std(first_half_reward_rt);
mean_second_half_reward_rt = mean(second_half_reward_rt);
sd_second_half_reward_rt = std(second_half_reward_rt);

mean_first_half_perception_accuracy = mean(first_half_perception_accuracy);
sd_first_half_perception_accuracy = std(first_half_perception_accuracy);
mean_second_half_perception_accuracy = mean(second_half_perception_accuracy);
sd_second_half_perception_accuracy = std(second_half_perception_accuracy);

mean_first_half_perception_rt = mean(first_half_perception_rt);
sd_first_half_perception_rt = std(first_half_perception_rt);
mean_second_half_perception_rt = mean(second_half_perception_rt);
sd_second_half_perception_rt = std(second_half_perception_rt);


%% Separate data by conditions

Reward_rts = [];
Reward_accuracies = [];
Perception_rts = [];
Perception_accuracies = [];

for i=1:4
    block_filename = strcat('sub008_reduced_block', num2str(i), 'conditions.mat');
    load(block_filename, 'onsets');
    Perception_rts = [Perception_rts; onsets{4}];
    Perception_accuracies = [Perception_accuracies; onsets{3}];
   
end

for i=5:8
    block_filename = strcat('sub008_reduced_block', num2str(i), 'conditions.mat');
    load(block_filename, 'onsets');
    Reward_rts = [Reward_rts; onsets{4}];
    Reward_accuracies = [Reward_accuracies; onsets{3}];
end


Reward_mean_rt = mean(Reward_rts);
Reward_std_rt = std(Reward_rts);  
Reward_mean_accuracy = mean(Reward_accuracies);
Reward_std_accuracy = std(Reward_accuracies);  

Perception_mean_rt = mean(Perception_rts);
Perception_std_rt = std(Perception_rts);  
Perception_mean_accuracy = mean(Perception_accuracies);
Perception_std_accuracy = std(Perception_accuracies);


% Save overall results

subject_id = 'sub008'; % Replace 'sub001' with the actual subject ID
save_filename = sprintf('%s_Merged_BehavioralResults.mat', subject_id);
save(save_filename, 'all_reaction_times', 'all_response_accuracies', 'Block_rts', 'Block_accuracies', ...
                    'Reward_rts', 'Reward_accuracies', 'Reward_mean_rt', 'Reward_std_rt', 'Reward_mean_accuracy','Reward_std_accuracy', ...
                    'Perception_rts', 'Perception_accuracies', 'Perception_mean_rt', 'Perception_std_rt', 'Perception_mean_accuracy','Perception_std_accuracy',  ...
                    ...
                    'first_half_reward_accuracy', 'first_half_reward_rt', 'second_half_reward_accuracy',  'second_half_reward_rt', ...
                    'first_half_perception_accuracy', 'first_half_perception_rt', 'second_half_perception_accuracy', 'second_half_perception_rt', ...
                    ...
                    'mean_first_half_reward_accuracy','sd_first_half_reward_accuracy', 'mean_second_half_reward_accuracy', 'sd_second_half_reward_accuracy', ...
                    'mean_first_half_reward_rt', 'sd_first_half_reward_rt', 'mean_second_half_reward_rt', 'sd_second_half_reward_rt',...
                    'mean_first_half_perception_accuracy', 'sd_first_half_perception_accuracy', 'mean_second_half_perception_accuracy', 'sd_second_half_perception_accuracy',...
                    'mean_first_half_perception_rt', 'sd_first_half_perception_rt', 'mean_second_half_perception_rt', 'sd_second_half_perception_rt');





% Display results for conditions

fprintf('Reward - Mean RT: %.2f seconds, Std RT: %.2f, Mean Accuracy: %.2f%%, Std Accuracy: %.2f\n', Reward_mean_rt, Reward_std_rt, Reward_mean_accuracy * 100, Reward_std_accuracy);
fprintf('Perception - Mean RT: %.2f seconds, Std RT: %.2f, Mean Accuracy: %.2f%%, Std Accuracy: %.2f\n', Perception_mean_rt, Perception_std_rt, Perception_mean_accuracy * 100, Perception_std_accuracy);

% Display results for blocks
fprintf('Reward - First Half: Mean Accuracy %.2f%% (Std %.2f), Mean RT: %.2f s (Std %.2f)\n', mean_first_half_reward_accuracy * 100, sd_first_half_reward_accuracy, mean_first_half_reward_rt, sd_first_half_reward_rt);
fprintf('Reward - Second Half: Mean Accuracy %.2f%% (Std %.2f), Mean RT: %.2f s (Std %.2f)\n', mean_second_half_reward_accuracy * 100, sd_second_half_reward_accuracy, mean_second_half_reward_rt, sd_second_half_reward_rt);
fprintf('Perception - First Half: Mean Accuracy %.2f%% (SD %.2f), Mean RT: %.2f s (Std %.2f)\n', mean_first_half_perception_accuracy * 100, sd_first_half_perception_accuracy, mean_first_half_perception_rt, sd_first_half_perception_rt);
fprintf('Perception - Second Half: Mean Accuracy %.2f%% (Std %.2f), Mean RT: %.2f s (Std %.2f)\n', mean_second_half_perception_accuracy * 100, sd_second_half_perception_accuracy, mean_second_half_perception_rt, sd_second_half_perception_rt);


%% Plot results

figure;

% Subplot 1: Reaction Times for Reward
subplot(2,2,1);
bar([1, 2], [mean_first_half_reward_rt, mean_second_half_reward_rt]);
hold on;
errorbar([1, 2], [mean_first_half_reward_rt, mean_second_half_reward_rt], ...
         [sd_first_half_reward_rt, sd_second_half_reward_rt], 'k.', 'LineStyle', 'none');
hold off;
title('Reward - Reaction Times');
xlabel('Blocks');
ylabel('Mean Reaction Time (s)');
xticks([1, 2]);
xticklabels({'First Half', 'Second Half'});

% Subplot 2: Reaction Times for Perception
subplot(2,2,2);
bar([1, 2], [mean_first_half_perception_rt, mean_second_half_perception_rt]);
hold on;
errorbar([1, 2], [mean_first_half_perception_rt, mean_second_half_perception_rt], ...
         [sd_first_half_perception_rt, sd_second_half_perception_rt], 'k.', 'LineStyle', 'none');
hold off;
title('Perception - Reaction Times');
xlabel('Blocks');
ylabel('Mean Reaction Time (s)');
xticks([1, 2]);
xticklabels({'First Half', 'Second Half'});

% Subplot 3: Accuracies for Reward
subplot(2,2,3);
bar([1, 2], [mean_first_half_reward_accuracy, mean_second_half_reward_accuracy] * 100);
hold on;
errorbar([1, 2], [mean_first_half_reward_accuracy, mean_second_half_reward_accuracy] * 100, ...
         [sd_first_half_reward_accuracy, sd_second_half_reward_accuracy], 'k.', 'LineStyle', 'none');
hold off;
title('Reward - Accuracy');
xlabel('Blocks');
ylabel('Mean Accuracy (%)');
xticks([1, 2]);
xticklabels({'First Half', 'Second Half'});

% Subplot 4: Accuracies for Perception
subplot(2,2,4);
bar([1, 2], [mean_first_half_perception_accuracy, mean_second_half_perception_accuracy] * 100);
hold on;
errorbar([1, 2], [mean_first_half_perception_accuracy, mean_second_half_perception_accuracy] * 100, ...
         [sd_first_half_perception_accuracy, sd_second_half_perception_accuracy], 'k.', 'LineStyle', 'none');
hold off;
title('Perception - Accuracy');
xlabel('Blocks');
ylabel('Mean Accuracy (%)');
xticks([1, 2]);
xticklabels({'First Half', 'Second Half'});

% Add a title to the entire figure and save the figure
sgtitle('Subject 8'); 
saveas(gcf, 'sub008_merged_summary.png');