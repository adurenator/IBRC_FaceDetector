
function dets = ScanImageFixedSize(Cparams, im)

    % detect whether the image is grayscale
    if size(im, 3) > 1
        im = double(rgb2gray(im));
    end
    
    ii_im  = cumsum(cumsum(im, 1), 2);
    ii_im2 = cumsum(cumsum(im .* im, 1), 2);
    
    % Sub-window size
    L  = 19;
    L2 = L * L;
    
    % sub-wimdows index limits
    row = size(im, 1) - (L - 1);
    col = size(im, 2) - (L - 1);
    
    % sparse fmat
    sfmat = sparse(Cparams.fmat(:, 1:Cparams.numFeatures));
    
    % auxiliar variables
    a = Cparams.alphas;
    t = Cparams.Thetas; % each row [j, theta, p]
    
    % memory reservation for speeding
    dets  = zeros(row * col, 4);
    index = 0;
    
    % Checking all sub-windows
    for i = 2:3:row,
        for j = 2:3:col,
            
            % INLINE: ApplyDetector2
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            % Getting the sub-window
            ii1    = im(i:i + (L - 1), j:j + (L - 1));
            
            % Normalize it
            mu    = ComputeBoxSum(ii_im, j, i, L, L) / L2;
            sigma = sqrt((ComputeBoxSum(ii_im2, j, i, L, L) - (L2 * mu * mu)) / (L2 - 1));
            ii1   = (ii1 - mu) / (sigma + (10^-12));
            
            % Integral image of it
            ii_im1 = cumsum(cumsum(ii1, 1), 2);
            
            % Compute features for the sub-window
            F      = ii_im1(:)' * sfmat;
            
            % Getting the score
            sc = a' * ((t(:, 3) .* F(t(:, 1))') < (t(:, 3) .* t(:, 2)));

            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            if sc > Cparams.thresh
                index          = index + 1;
                detection      = [j i L L];
                dets(index, :) = detection(:);
            end
            
        end 
    end
    
    % shrinking the matrix
    dets = dets(1:index, :);

end