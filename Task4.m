
% Task 4
clear;
clc;
clf;

Fdata    = load('FaceData.mat');
NFdata   = load('NonFaceData.mat');
FTdata   = load('FeaturesToUse.mat');
Cparams  = load('Cparams.mat');

% Debug code for ScanImageFixedSize ===> OK
% value of orig should be the same as the last of dets
% [im, ii_im] = LoadIm('TrainingImages/FACES/face00001.bmp');
% orig        = ApplyDetector(Cparams, ii_im);
% dets        = ScanImageFixedSize(Cparams, im);

% Debug code for DisplayDetections ===> OK

image_name = 'TestImages/IMG_0184.jpg';
im = imread(image_name);
%profile on
dets        = ScanImageOverScale(Cparams, FTdata, im, 0.2, 1.3, 0.04);
%dets        = ScanImageFixedSize(Cparams, FTdata, im);
%profile viewer

% Display the image and the detections
imshow(im)
axis equal
%DisplayDetections(dets, 'r', 1);
pdets = PruneDetections(dets, 'bounding-box');
DisplayDetections(pdets, 'g', 1, 'text');
%pdets = PruneDetections(dets, 'average');
%DisplayDetections(pdets, 'b', 2, 'text');
