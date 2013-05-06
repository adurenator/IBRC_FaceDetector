%%
% Implements the AdaBoost algorithm.
%
% Fdata: field ii_ims holds the integral images (stored as rows)
% NFdata:
% FTdata:
% T: number of weak classifiers used in the final strong classifier
%
function Cparams = BoostingAlg(Fdata, NFdata, FTdata, T)

% number of faces
nf = length(Fdata.fnums);
% number of non-faces
nnf = length(NFdata.fnums);
% size of feature vectors
n = size(Fdata.ii_ims, 1);
% feature vector labels
labels = [ones(1, nf) zeros(1, nnf)];
% initialize the n weights
w(labels==0) = 1/(2*nnf);
w(labels==1) = 1/(2*nf);

for t = 0:T
   % normalize the weights so they sum up to one
   w(:) = w(:)/sum(w(:));
   
   % loop over each feature vector
   for i = 1:
end

Cparams.alphas = 0;
Cparams.Thetas = 0;
Cparams.fmat = 0;
Cparams.all_ftypes = 0;

end
