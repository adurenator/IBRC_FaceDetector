
% Task 2 debugging

dinfo6 = load('DebugInfo/debuginfo6.mat');
T = dinfo6.T;
Cparams = BoostingAlg(Fdata, NFdata, FTdata, T, 1000);
%sum(abs(dinfo6.alphas - Cparams.alphas))
%sum(abs(dinfo6.Thetas(:) - Cparams.Thetas(:)))
[dinfo6.alphas Cparams.alphas]
[dinfo6.Thetas(:) Cparams.Thetas(:)]