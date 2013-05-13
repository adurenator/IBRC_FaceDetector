
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
orig        = ApplyDetector(Cparams, ii_im);
dets        = ScanImageFixedSize(Cparams, im);

% Debug code for DisplayDetections ===> OK
% (using a threshold of 8)
Cparams.thresh = 8;
image_name = 'TestImages/big_one_chris.png';
im = imread(image_name);
profile on
dets        = ScanImageOverScale(Cparams, im, 0.6, 1.3, 0.06);
%dets        = ScanImageFixedSize(Cparams, im);
profile viewer

% Display the image and the detections
imshow(im)
axis equal
DisplayDetections(dets, 'r', 1);
DisplayDetections(PruneDetections(dets), 'g', 2);