
clear;
clc;

Fdata  = load('FaceData.mat');
NFdata = load('NonFaceData.mat');
FTdata = load('FeaturesToUse.mat');

Cparams = BoostingAlg(Fdata, NFdata, FTdata, 3, 1000);

[im, ii_im] = LoadIm('TrainingImages/FACES/face00001.bmp');
sc = ApplyDetector(Cparams, ii_im(:))