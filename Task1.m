
clear;
clc;

dinfo5     = load('DebugInfo/debuginfo5.mat');
np         = dinfo5.np;
nn         = dinfo5.nn;
all_ftypes = dinfo5.all_ftypes;

disp('Variables loaded!');

rng(dinfo5.jseed);
GetTrainingData(all_ftypes, np, nn);

disp('Trainig data gathered!');

Fdata  = load('FaceData.mat');
NFdata = load('NonFaceData.mat');
FTdata = load('FeaturesToUse.mat');

disp('Task 1 DONE!!');