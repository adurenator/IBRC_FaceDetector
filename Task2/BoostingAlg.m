%%
% Implements the AdaBoost algorithm.
%
% Fdata: field ii_ims holds the face images (stored as rows)
% NFdata: field ii_ims holds the non-face images (stored as rows)
% FTdata:
% T: number of weak classifiers used in the final strong classifier
% Nft: Number of features to use
%
function Cparams = BoostingAlg(Fdata, NFdata, FTdata, T, Nft)

    % all image data
    Idata = [Fdata.ii_ims; NFdata.ii_ims] * sparse(FTdata.fmat(:, 1:Nft));

    % number of faces
    nf = size(Fdata.ii_ims, 1);
    % number of non-faces
    nnf = size(NFdata.ii_ims, 1);

    % feature vector labels
    labels = [ones(nf, 1); zeros(nnf, 1)];

    % Initialize the weights
    ws = zeros(size(labels));
    ws(labels == 0) = 1/(2 * nnf);
    ws(labels == 1) = 1/(2 * nf);

    % initialize the thetas of the strong classifier
    Cparams.Thetas = zeros(T, 3);
    Cparams.alphas = zeros(T, 1);

    for t = 1:T
       % Normalize the n weights so they sum up to one
       ws(:) = ws(:) / sum(ws(:));
       Err   = Inf;
       J     = 1;
        fprintf('%d / %d \n', t, T);
       % loop over each feature
       for j = 1:Nft

          % Calculate a weak classifier for the j:th feature of the i:th
          % feature vector
          
          % INLINE: LearnWeakClassifier
          %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

            feature = Idata(:, j);
            aux     = ws .* feature;
            aux1    = (1 - labels);

            % weighted mean for positive examples
            p_mean = (aux' * labels) / (ws' * labels);

            % weighted mean for negative examples
            n_mean = (aux' * aux1) / (ws' * aux1);

            % threshold
            theta = 0.5 * (p_mean + n_mean);

            % error parity -1
            err_1 = ws' * abs(labels - (-feature < -theta));

            % error parity 1
            err1 = ws' * abs(labels - (feature < theta));

            % get the output values acording to the min error
            if err_1 < err1
                p   = -1;
                err = err_1;
            else
                p   = 1;
                err = err1;
            end      

          %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

          % Update the parameters if the error is a new minimum
          if err < Err
              Cparams.Thetas(t, :) = [j, theta, p];
              Theta = theta;
              P = p;
              J = j;
              % Update the minimum error 
              Err = err;
          end
       end

       % Update the weights
       beta = Err/(1 - Err);
       ws = ws .* (beta .^ (1 - abs(((Idata(:, J) * P) < (P * Theta)) - labels)));
       Cparams.alphas(t) = log(1 / beta);
    end

    Cparams.fmat        = FTdata.fmat;
    Cparams.numFeatures = Nft;

end
