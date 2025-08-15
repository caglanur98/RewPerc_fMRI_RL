%% Import data from text file
% Script for importing data from the following text file:

filename = '/Users/caglademirkan/Documents/MATLAB/behavioral_data/sub008_1204_fMRItask_V2021.2.3.3_new_2024_Apr_12_1049.csv'


%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 155, "Encoding", "UTF-8");

% Specify range and delimiter
opts.DataLines = [1, 292];
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["conditionBlock", "instImg", "instText", "blockImg", "stim1", "stim2", "stim3", "stim1prob", "stim2prob", "stim3prob", "normProb1", "normProb2", "normProb3", "corrAns1", "corrAns2", "corrAns3", "oldAlien", "oldAlienIndex", "newAlien", "newAlienIndex", "sentence", "conditionsthisRepN", "conditionsthisTrialN", "conditionsthisN", "conditionsthisIndex", "trialsthisRepN", "trialsthisTrialN", "trialsthisN", "trialsthisIndex", "image_3started", "image_3stopped", "key_respkeys", "key_resprt", "key_respstarted", "key_respstopped", "key_resp_nextkeys", "key_resp_nextrt", "key_resp_nextstarted", "key_resp_nextstopped", "ConditionStart1fmri", "image_2started", "image_2stopped", "block_Inststarted", "block_Inststopped", "space_for_nextkeys", "space_for_nextrt", "space_for_nextstarted", "space_for_nextstopped", "BlockStart1fmri", "textstarted", "textstopped", "jitter1_durationfmri", "jitter1_startfmri", "jitter1_stopfmri", "text_3started", "text_3stopped", "TrialStartfmri", "blockImagestarted", "blockImagestopped", "stimLeftstarted", "stimLeftstopped", "stimCenterstarted", "stimCenterstopped", "stimRightstarted", "stimRightstopped", "progressFeedbackstarted", "progressFeedbackstopped", "progressFeedback_textstarted", "progressFeedback_textstopped", "key_responsekeys", "key_responsestarted", "key_responsestopped", "reward_Tot", "current_condition", "correct_answer", "inst_key_pressed", "Respondfmri", "blockImage_3started", "blockImage_3stopped", "stimLeft_3started", "stimLeft_3stopped", "stimCenter_3started", "stimCenter_3stopped", "stimRight_3started", "stimRight_3stopped", "partChoicestarted", "partChoicestopped", "particYourChoicestarted", "particYourChoicestopped", "progresssFeedback_2started", "progresssFeedback_2stopped", "progressFeedback_text_2started", "progressFeedback_text_2stopped", "bgstarted", "bgstopped", "image_leftstarted", "image_leftstopped", "image_rightstarted", "image_rightstopped", "image_centerstarted", "image_centerstopped", "text_6started", "text_6stopped", "jitter2_durationfmri", "jitter2_startfmri", "jitter2_stopfmri", "text_4started", "text_4stopped", "feedbackStartfmri", "feedbackStopfmri", "blockImage_2started", "blockImage_2stopped", "stimLeft_2started", "stimLeft_2stopped", "stimCenter_2started", "stimCenter_2stopped", "stimRight_2started", "stimRight_2stopped", "partChoice_2started", "partChoice_2stopped", "particYourChoice_2started", "particYourChoice_2stopped", "pointFeedbackstarted", "pointFeedbackstopped", "pointFeedback_textstarted", "pointFeedback_textstopped", "progressFeedback_3started", "progressFeedback_3stopped", "progressFeedback_text_3started", "progressFeedback_text_3stopped", "participant_block_accuracy", "BlockfeedbackStartfmri", "block_feedbackMsgstarted", "block_feedbackMsgstopped", "BlockfeedbackStopfmri", "key_responsert", "BlockStart2fmri", "BlockStart3fmri", "BlockStart4fmri", "participant_condition_accuracy", "condition_feedbackAccuracystarted", "condition_feedbackAccuracystopped", "ConditionStart0fmri", "participant_block_bonus", "participant_condition_bonus", "endExperimentfmri", "text_5started", "text_5stopped", "participant", "session", "date", "expName", "psychopyVersion", "frameRate", "VarName155"];
opts.VariableTypes = ["double", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "double", "double", "double", "double", "double", "double", "categorical", "categorical", "categorical", "categorical", "double", "categorical", "double", "categorical", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "string", "double", "double", "double", "string", "double", "double", "double", "double", "categorical", "categorical", "double", "double", "categorical", "double", "categorical", "categorical", "double", "double", "double", "double", "categorical", "double", "double", "categorical", "double", "categorical", "double", "categorical", "double", "categorical", "double", "categorical", "double", "categorical", "double", "double", "categorical", "double", "double", "double", "double", "double", "double", "categorical", "double", "categorical", "double", "categorical", "double", "categorical", "double", "categorical", "double", "categorical", "double", "categorical", "double", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "double", "double", "double", "double", "categorical", "double", "double", "double", "categorical", "double", "categorical", "double", "categorical", "double", "categorical", "double", "categorical", "double", "categorical", "double", "categorical", "double", "categorical", "double", "categorical", "double", "categorical", "double", "double", "double", "categorical", "double", "double", "double", "double", "double", "double", "double", "string", "double", "double", "string", "string", "double", "double", "categorical", "double", "categorical", "categorical", "categorical", "double", "string"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, ["key_respstopped", "key_resp_nextstopped", "condition_feedbackAccuracystopped", "participant_condition_bonus", "endExperimentfmri", "VarName155"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["instImg", "instText", "blockImg", "stim1", "stim2", "stim3", "corrAns1", "corrAns2", "corrAns3", "oldAlien", "newAlien", "sentence", "key_respstopped", "key_resp_nextstopped", "block_Inststopped", "space_for_nextkeys", "space_for_nextstopped", "textstarted", "textstopped", "text_3stopped", "blockImagestopped", "stimLeftstopped", "stimCenterstopped", "stimRightstopped", "progressFeedbackstopped", "progressFeedback_textstopped", "key_responsestopped", "blockImage_3stopped", "stimLeft_3stopped", "stimCenter_3stopped", "stimRight_3stopped", "partChoicestopped", "particYourChoicestopped", "progresssFeedback_2stopped", "progressFeedback_text_2stopped", "bgstarted", "bgstopped", "image_leftstarted", "image_leftstopped", "image_rightstarted", "image_rightstopped", "image_centerstarted", "image_centerstopped", "text_6started", "text_6stopped", "text_4stopped", "blockImage_2stopped", "stimLeft_2stopped", "stimCenter_2stopped", "stimRight_2stopped", "partChoice_2stopped", "particYourChoice_2stopped", "pointFeedbackstopped", "pointFeedback_textstopped", "progressFeedback_3stopped", "progressFeedback_text_3stopped", "block_feedbackMsgstopped", "condition_feedbackAccuracystopped", "participant_condition_bonus", "endExperimentfmri", "participant", "date", "expName", "psychopyVersion", "VarName155"], "EmptyFieldRule", "auto");
opts = setvaropts(opts, ["image_3stopped", "image_2stopped", "text_5started", "text_5stopped"], "TrimNonNumeric", true);
opts = setvaropts(opts, ["image_3stopped", "image_2stopped", "text_5started", "text_5stopped"], "ThousandsSeparator", ",");

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

for i=1:length(fmri_block_onsets)

    if i < length(fmri_block_onsets)

        scene_onsets = beh_log(fmri_block_onsets(i):fmri_block_onsets(i+1)-1,:).TrialStartfmri;

        response_onsets = beh_log(fmri_block_onsets(i):fmri_block_onsets(i+1)-1,:).Respondfmri;
        response_accuracy = beh_log(fmri_block_onsets(i):fmri_block_onsets(i+1)-1,:).correct_answer;

        feedback_onsets = beh_log(fmri_block_onsets(i):fmri_block_onsets(i+1)-1,:).feedbackStartfmri;


        stimuli = [beh_log(fmri_block_onsets(i):fmri_block_onsets(i+1)-1,:).stim1 ...
            beh_log(fmri_block_onsets(i):fmri_block_onsets(i+1)-1,:).stim2 ...
            beh_log(fmri_block_onsets(i):fmri_block_onsets(i+1)-1,:).stim3];

        if size(stimuli,1) == 37
            stimuli(end,:) = [];
        end

        unique_stimuli = unique(stimuli);

        stimuli_code = zeros(size(stimuli));

        for j=1:size(stimuli,1)
            for k=1:size(stimuli,2)
                stimuli_code(j,k) = find(unique_stimuli == stimuli(j,k));
            end
        end

        button_presses = beh_log(fmri_block_onsets(i):fmri_block_onsets(i+1)-1,:).inst_key_pressed;

    else

        scene_onsets = beh_log(fmri_block_onsets(i):end-1,:).TrialStartfmri;

        response_onsets = beh_log(fmri_block_onsets(i):end-1,:).Respondfmri;
        response_accuracy = beh_log(fmri_block_onsets(i):end-1,:).correct_answer;

        feedback_onsets = beh_log(fmri_block_onsets(i):end-1,:).feedbackStartfmri;

        stimuli = [beh_log(fmri_block_onsets(i):end-1,:).stim1 ...
            beh_log(fmri_block_onsets(i):end-1,:).stim2 ...
            beh_log(fmri_block_onsets(i):end-1,:).stim3];

        if size(stimuli,1) == 37
            stimuli(end,:) = [];
        end

        unique_stimuli = unique(stimuli);

        stimuli_code = zeros(size(stimuli));

        for j=1:size(stimuli,1)
            for k=1:size(stimuli,2)
                stimuli_code(j,k) = find(unique_stimuli == stimuli(j,k));
            end
        end


        button_presses = beh_log(fmri_block_onsets(i):end-1,:).inst_key_pressed;

    end

    %     response_onsets(find(response_accuracy == -1)) = []; % missed trials
    %     feedback_onsets(find(response_accuracy == -1)) = []; % missed trials
    %     response_accuracy(find(response_accuracy == -1)) = []; % missed trials


%% Fitting 3 models to the behavioral data + model comparison

    [PE_regressor_RW, best_Eta_RW(i), best_Beta_RW(i), max_loglikelihood_RW(i), AIC_RW(i)] = RescorlaWagnermodel_updated(stimuli_code, button_presses, response_accuracy, 0); % RW

    [PE_regressor_RW2, best_Eta_1_RW2(i), best_Eta_2_RW2(i), best_Beta_RW2(i), max_loglikelihood_RW2(i), AIC_RW2(i)] = RescorlaWagner_new(stimuli_code, button_presses, response_accuracy, 0);  % RW+2

    [PE_regressor_RWCK, best_Beta_RWCK(i), best_Beta_c_RWCK(i), best_Eta_RWCK(i), best_Eta_c_RWCK(i), max_loglikelihood_RWCK(i), AIC_RWCK(i)] = RescorlaWagner_ChoiceKernel(stimuli_code, button_presses, response_accuracy, 0); % RW+CK


    if length(isnan(scene_onsets))>0
        feedback_onsets(find(isnan(scene_onsets))) = [];
        response_accuracy(find(isnan(scene_onsets))) = [];
        response_onsets(find(isnan(scene_onsets))) = [];

        PE_regressor_RW(find(isnan(scene_onsets))) = [];
        PE_regressor_RW2(find(isnan(scene_onsets))) = [];
        PE_regressor_RWCK(find(isnan(scene_onsets))) = [];
        scene_onsets(find(isnan(scene_onsets))) = [];
    end


    if length(isnan(PE_regressor_RW))>0
        feedback_onsets(find(isnan(PE_regressor_RW))) = [];
        PE_regressor_RW2(find(isnan(PE_regressor_RW2))) = [];
        PE_regressor_RWCK(find(isnan(PE_regressor_RWCK))) = [];
        PE_regressor_RW(find(isnan(PE_regressor_RW))) = [];
    end


    names = {'scene_onset_correct_and_incorrect' 'response_onset_correct' 'response_onset_incorrect' 'feedback_onset'};
    onsets = {scene_onsets(find(response_accuracy>=0)) response_onsets(find(response_accuracy==1))  response_onsets(find(response_accuracy==0)) feedback_onsets};
    durations = {zeros(length(find(response_accuracy>=0)),1) zeros(length(find(response_accuracy==1)),1) zeros(length(find(response_accuracy==0)),1) zeros(length(feedback_onsets),1)};

    pmod = struct('name',{''},'param',{},'poly',{});
    pmod(4).name{1} = 'PE';
    pmod(4).param{1} = PE_regressor_RWCK'; % change here accordingly (PE_regressor of the winning model)
    pmod(4).poly{1} = 1;

    filename = strcat('run',num2str(i),'conditions.mat');
    save(filename,'names','onsets','durations', 'pmod');

    save('Modelparams_sub008.mat','best_Eta_RW', 'best_Beta_RW', 'max_loglikelihood_RW', 'AIC_RW', ...
        'best_Eta_1_RW2', 'best_Eta_2_RW2', 'best_Beta_RW2', 'max_loglikelihood_RW2', 'AIC_RW2', ...
        'best_Beta_RWCK', 'best_Beta_c_RWCK', 'best_Eta_RWCK', 'best_Eta_c_RWCK', 'max_loglikelihood_RWCK', 'AIC_RWCK');
end



modelnames = {'RW' 'RW2' 'RWCK'};
sumAICs = [sum(AIC_RW) sum(AIC_RW2) sum(AIC_RWCK)];
modelnames(find(sumAICs == min(sumAICs)));

disp(['Winning model: ', modelnames(find(sumAICs == min(sumAICs)))]);


%% Winning model for Reward vs. Perception condition seperately
    %sub008: Cond_B= reward (change accordingly for other participants)

AIC_RW_reward = AIC_RW(5:8);
AIC_RW_perception = AIC_RW(1:4);

AIC_RW2_reward = AIC_RW2(5:8);
AIC_RW2_perception = AIC_RW2(1:4);

AIC_RWCK_reward = AIC_RWCK(5:8);
AIC_RWCK_perception = AIC_RWCK(1:4);

sumAICs_reward = [sum(AIC_RW_reward), sum(AIC_RW2_reward), sum(AIC_RWCK_reward)];
sumAICs_perception = [sum(AIC_RW_perception), sum(AIC_RW2_perception), sum(AIC_RWCK_perception)];

modelnames(find(sumAICs_reward == min(sumAICs_reward)));
modelnames(find(sumAICs_perception == min(sumAICs_perception)));

disp(['Winning model for Reward Condition: ', modelnames(find(sumAICs_reward == min(sumAICs_reward)))]);
disp(['Winning model for Perception Condition: ', modelnames(find(sumAICs_perception == min(sumAICs_perception)))]);


% Append these new variables to the existing MAT file
save('Modelparams_sub008.mat', 'sumAICs_reward', 'sumAICs_perception', '-append');


Condition = {'Overrall' 'Reward' 'Perception'};
WinnigModel = {modelnames(find(sumAICs == min(sumAICs))) modelnames(find(sumAICs_reward == min(sumAICs_reward))) modelnames(find(sumAICs_perception == min(sumAICs_perception)))};
AIC_value = {min(sumAICs) min(sumAICs_reward) min(sumAICs_perception)};
  

  
save('Results_sub008.mat','Condition','WinnigModel', 'AIC_value');
