
clear;
clc;

%% 8: ComputeFeature OK %%

im_fnames = dir('TrainingImages/FACES/');
im_fnames = im_fnames(3:103);

ii_ims = cell(100, 1);

for i = 1:100,
	[im, ii_im] = LoadIm(im_fnames(i).name);
	ii_ims{i}   = ii_im;
end

dinfo3    = load('DebugInfo/debuginfo3.mat');
ftype     = dinfo3.ftype;
funct_8   = round(sum(abs(dinfo3.fs - ComputeFeature(ii_ims, ftype))))


%% 9: VecBoxSum OK %%

[im, ii_im] = LoadIm('TrainingImages/FACES/face00001.bmp');
x = 3; y = 3;
w = 4; h = 4;

b_vec   = VecBoxSum(x, y, w, h, 19, 19);
A1      = ii_im(:)' * b_vec;
A2      = ComputeBoxSum(ii_im, x, y, w, h);
funct_9 = round(sum(abs(A2 - A1)))


%% 10: VecFeature OK %%

ftype_vec = VecFeature([2, x, y, w, h], 19, 19);
A1        = ii_im(:)' * ftype_vec;
A2        = FeatureTypeII(ii_im, x, y, w, h);
funct_10  = round(sum(abs(A2 - A1)))


%% 11: VecAllFeatures ?? %%

% nothing to debug. This function relies on others


%% 12: VecComputeFeature OK %%

W = 19; H = 19;

all_ftypes = EnumAllFeatures(W, H);
fmat       = VecAllFeatures(all_ftypes, W, H);

ii_ims  = zeros(100, W * H);
ii_ims1 = cell(100, 1);

for i = 1:100,
	[im, ii_im]  = LoadIm(im_fnames(i).name);
	ii_ims(i, :) = ii_im(:)';
    ii_ims1{i}   = ii_im;
end

fs1      = VecComputeFeature(ii_ims, fmat(:, 1));
fs2      = ComputeFeature(ii_ims1, all_ftypes(1, :));
funct_12 = round(sum(abs(fs2' - fs1)))


%% 13: LoadSaveImData OK %%

ni      = 100;
dirname = 'TrainingImages/FACES/';
im_sfn  = 'FaceData.mat';
LoadSaveImData(dirname, ni, im_sfn);
disp('Func_13 done');


%% 14: ComputeSaveFData OK %%

dinfo4     = load('DebugInfo/debuginfo4.mat');
ni         = dinfo4.ni;
all_ftypes = dinfo4.all_ftypes;
im_sfn     = 'FaceData.mat';
f_sfn      = 'FeaturesToMat.mat';
rng(dinfo4.jseed);

ii_ims = LoadSaveImData(dirname, ni, im_sfn);
fmat   = ComputeSaveFData(all_ftypes, f_sfn);

funct_14 = round(sum(sum(abs(fmat - dinfo4.fmat))))
funct_14 = round(sum(sum(abs(ii_ims - dinfo4.ii_ims))))


%% 15: GetTrainingData OK %%

% nothing to debug in this funct