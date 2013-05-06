clear;
clc;

%% ===== Function 8 ===== WRONG %%

im_fnames = dir('TrainingImages/FACES/');
im_fnames = im_fnames(3:103);

ii_ims = cell(100, 1);

for i = 1:100,
	[im, ii_im] = LoadIm(im_fnames(i).name);
	ii_ims{i} = ii_im;
end

dinfo3    = load('DebugInfo/debuginfo3.mat');
ftype     = dinfo3.ftype;
funct_8   = sum(abs(dinfo3.fs - ComputeFeature(ii_ims, ftype)) > eps)
%fprinf(1, 'Output test func 8: %d \n', out);


%% ===== Function 9 ===== OK %%

[im, ii_im] = LoadIm('TrainingImages/FACES/face00001.bmp');
x = 3; y = 3;
w = 4; h = 4;

b_vec   = VecBoxSum(x, y, w, h, 19, 19);
A1      = ii_im(:)' * b_vec;
A2      = ComputeBoxSum(ii_im, x, y, w, h);
funct_9 = sum(abs(A2 - A1))
%fprinf('Output test func 9: %i', out);


%% ===== Funtion 10 ===== OK %%

ftype_vec = VecFeature([1, x, y, w, h], 19, 19);
A1        = ii_im(:)' * ftype_vec;
A2        = FeatureTypeI(ii_im, x, y, w, h);
funct_10  = sum(abs(A2 - A1))
%fprinf('Output test func 10: %i', out);


%% ===== Funtion 11 ===== %%



%% ===== Funtion 12 ===== %%



%% ===== Funtion 13 ===== %%



%% ===== Funtion 14 ===== %%



%% ===== Funtion 15 ===== %%

