% List of open inputs
nrun =1; % enter the number of runs here
jobfile = {'/Users/caglademirkan/Documents/MATLAB/sub008_1204/fmri_preprocess_job_sub008.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(0, nrun);
for crun = 1:nrun
end
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});
