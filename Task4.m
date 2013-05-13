
% Task 4
clear;
clc;
clf;

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
col_im = imread('TestImages/one_chris.png');
[im, ii_im] = LoadIm('TestImages/one_chris.png');
dets        = ScanImageFixedSize(Cparams, im);

% Display the image and the detections
imshow(col_im)
axis equal
DisplayDetections(dets, 'r', 1);
DisplayDetections(PruneDetections(dets), 'g', 2);