
clear;
clc;

dinfo5     = load('DebugInfo/debuginfo5.mat');
np         = dinfo5.np;
nn         = dinfo5.nn;
all_ftypes = dinfo5.all_ftypes;
rng(dinfo5.jseed);

disp('Task 1 -> Variables loaded!');

GetTrainingData(all_ftypes, np, nn);

disp('Task 1 -> Trainig data gathered!');

% instructions to load the data we will use in following tasks
Fdata  = load('FaceData.mat');
NFdata = load('NonFaceData.mat');
FTdata = load('FeaturesToUse.mat');

disp('Task 1 -> DONE!!');