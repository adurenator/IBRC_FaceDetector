 
% Task 3

clear;
clc;

% Loading
Fdata  = load('FaceData.mat');
NFdata = load('NonFaceData.mat');
FTdata = load('FeaturesToUse.mat');

% Training Strong Classifier
dinfo7  = load('DebugInfo/debuginfo7.mat');
T       = dinfo7.T;
Cparams = BoostingAlg(Fdata, NFdata, FTdata, T, size(FTdata.fmat, 2));

% Computing ROC to determine Threshold
ComputeROC(Cparams, Fdata, NFdata);

save('Cparams.mat', 'Cparams');