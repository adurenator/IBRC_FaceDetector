
% Task 4
clear;
clc;

Fdata   = load('FaceData.mat');
NFdata  = load('NonFaceData.mat');
FTdata  = load('FeaturesToUse.mat');
Cparams = load('Cparams.mat');


% Debug code for ScanImageFixedSize ===> OK
% value of orig should be the same as the last of dets
[im, ii_im] = LoadIm('TrainingImages/FACES/face00001.bmp');
orig        = ApplyDetector(Cparams, ii_im)
dets        = ScanImageFixedSize(Cparams, im)


% Debug code for DisplayDetections ===> ??
[im, ii_im] = LoadIm('TestImages/one_chris.png');
dets        = ScanImageFixedSize(Cparams, im);
DisplayDetections(im, PruneDetections(dets));