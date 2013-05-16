
function dets = ScanImageFixedSize(Cparams, FTdata, im)

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
    
    % auxiliar variables
    a = Cparams.alphas;
    t = Cparams.Thetas; % each row [j, theta, p]
    
    % sparse fmat
    sfmat = sparse(Cparams.fmat(:, t(:, 1)));
    
    % memory reservation for speeding
    dets  = zeros(row * col, 4);
    index = 0;
    
    types3 = (FTdata.all_ftypes(t(:, 1), 1) == 3)';
    w = FTdata.all_ftypes(t(:, 1), 4);
    h = FTdata.all_ftypes(t(:, 1), 5);
    
    % Checking all sub-windows
    for i = 2:2:row,
        for j = 2:2:col,
            
            % INLINE: ApplyDetector2
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            % Getting the sub-window
            ii1    = im(i:i + (L - 1), j:j + (L - 1));
            
            % Normalize it
            mu    = ComputeBoxSum(ii_im, j, i, L, L) / L2;
            sigma = sqrt((ComputeBoxSum(ii_im2, j, i, L, L) - (L2 * mu * mu)) / (L2 - 1));
            
            % Sigma threshold to exclude plain areas
            if sigma > 15
            
                % Integral image of it
                ii_im1 = cumsum(cumsum(ii1, 1), 2);

                % Compute features for the sub-window 
                F    = ((ii_im1(:)' * sfmat) / sigma) + ...
                        ((w .* h)' .* (mu/sigma) .* types3);

                % Getting the score
                sc = a' * ((t(:, 3) .* F(:)) < (t(:, 3) .* t(:, 2)));

                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                if sc > Cparams.thresh
                    index          = index + 1;
                    detection      = [j i L L];
                    dets(index, :) = detection(:);
                end
                
            end
            
        end 
    end
    
    % shrinking the matrix
    dets = dets(1:index, :);

end