
% Task 2 debugging

%% LearnWeakClassifier DEBUG CODE %%

fs  = [Fdata.ii_ims; NFdata.ii_ims] * FTdata.fmat(:, 12028);
nf  = size(Fdata.ii_ims, 1);
nnf = size(NFdata.ii_ims, 1);
ys  = [ones(nf, 1); zeros(nnf, 1)];
ws  = zeros(size(ys));
ws(ys == 0) = 1/(2 * nnf);
ws(ys == 1) = 1/(2 * nf);

[theta, p, err] = LearnWeakClassifier(ws, fs, ys, 1)

%% BoostingAlg DEBUG CODE %%

dinfo6 = load('DebugInfo/debuginfo6.mat');
T = dinfo6.T;
Cparams = BoostingAlg(Fdata, NFdata, FTdata, T, 1000);
%sum(abs(dinfo6.alphas - Cparams.alphas))
%sum(abs(dinfo6.Thetas(:) - Cparams.Thetas(:)))
[dinfo6.alphas Cparams.alphas]
[dinfo6.Thetas(:) Cparams.Thetas(:)]