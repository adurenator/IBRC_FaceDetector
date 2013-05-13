 
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
profile on
Cparams = BoostingAlg(Fdata, NFdata, FTdata, T, size(FTdata.fmat, 2));
profile viewer

% Computing ROC to determine Threshold
%Cparams = ComputeROC(Cparams, Fdata, NFdata);

%{
Thetas      = Cparams.Thetas;
alphas      = Cparams.alphas;
fmat        = Cparams.fmat;
numFeatures = Cparams.numFeatures;
thresh      = Cparams.thresh;

save('Cparams.mat', 'Thetas', 'alphas', 'fmat', 'numFeatures', 'thresh');
%}