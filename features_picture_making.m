
clear;
clc;
clf;

Fdata    = load('FaceData.mat');
NFdata   = load('NonFaceData.mat');
FTdata   = load('FeaturesToUse.mat');
Cparams  = load('Cparams.mat');

figure(1);
colormap gray;

chosen_f = Cparams.Thetas(1:10, 1);

img = cell(1, 11);

for i = 1:10,
    %subplot(1, 11, i);
    img{i} = MakeFeaturePic(FTdata.all_ftypes(chosen_f(i), :), 19, 19);
    %imagesc(x);
    %axis equal;
end

%subplot(1, 11, 11);
img{11} = MakeClassifierPic(FTdata.all_ftypes, chosen_f, Cparams.alphas(1:10), Cparams.Thetas(1:10, 3), 19, 19);
%imagesc(xxx);
%axis equal;

montage(img, 'Size', [1, 11]);