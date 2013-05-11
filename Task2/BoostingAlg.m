%%
% Implements the AdaBoost algorithm.
%
% Fdata: field ii_ims holds the face images (stored as rows)
% NFdata: field ii_ims holds the non-face images (stored as rows)
% FTdata:
% T: number of weak classifiers used in the final strong classifier
%
function Cparams = BoostingAlg(Fdata, NFdata, FTdata, T)

% all image data
Idata = [Fdata.ii_ims; NFdata.ii_ims];
% number of faces
nf = length(Fdata.fnums);
% number of non-faces
nnf = length(NFdata.fnums);
% number of feature vectors
n = nf + nnf;
% size of each feature vector
N = size(Fdata.ii_ims, 2);
% feature vector labels
labels = [ones(1, nf) zeros(1, nnf)];
% normalize the n weights so they sum up to one
w(labels==0) = 1/(2*nnf);
w(labels==1) = 1/(2*nf);
w(:) = w(:)/sum(w(:));

% initialize the thetas of the strong classifier
Cparams.Thetas = zeros(T, 2);
Cparams.aplhas = zeros(T, 1);

for t = 0:T   
   % the error for each feature in the feature vectors
   %e = zeros(1, N);
   Err = Inf;
   Theta = 0;
   P = 0;
   J = 0;
   
   % loop over each feature
   for j = 1:N
      % loop over each feature vector
      %e(j) = sum(w(:).*abs((Idata(:,j)*p < p*theta)-labels(:)));
      
      % Calculate a weak classifier for the j:th feature of the i:th
      % feature vector
      [theta, p, err] = LearnWeakClassifier(w, Idata, labels, j);
      
      % Update the parameters if the error is a new minimum
      if err < Err
          Cparams.Thetas(t) = [j, theta];
          Theta = theta;
          P = p;
          J = j;
          % Update the error minimum
          Err = err;
      end
   end
   
   % Update the weights
   beta = err/(1 - err);
   w(:) = w(:).*beta.^(1 - abs((Idata(:, J)*P < P*Theta) - labels(:)));
   Cparams.alphas(t) = log(1/beta);
end

Cparams.fmat = 0;
Cparams.all_ftypes = 0;

end
