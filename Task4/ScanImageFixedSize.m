
function dets = ScanImageFixedSize(Cparams, im)

    % detect whether the image is grayscale
    if size(im, 3) > 1
        im = double(rgb2gray(im));
    end
    
    % Sub-window size
    W  = 19;
    H  = 19;
    
    % sub-wimdows index limits
    row = size(im, 1) - (H - 1);
    col = size(im, 2) - (W - 1);
    
    % sparse fmat
    sfmat = sparse(Cparams.fmat(:, 1:Cparams.numFeatures));
    
    % auxiliar variables
    a = Cparams.alphas;
    t = Cparams.Thetas; % each row [j, theta, p]
    
    % memory reservation for speeding
    dets  = zeros(row * col, 4);
    index = 0;
    
    % Checking all sub-windows
    for i = 1:row,
        for j = 1:col,
            
            % INLINE: ApplyDetector2
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            % Getting the sub-window
            ii1    = im(i:i + (H - 1), j:j + (W - 1));
            % Normalize it
            ii1    = (ii1 - mean(ii1(:))) / (std(ii1(:)) + (10^-12));
            % Integral image of it
            ii_im1 = cumsum(cumsum(ii1, 1), 2);
            % Compute features for the sub-window
            F      = ii_im1(:)' * sfmat;
            sc     = 0;
            
            % Getting the score
            for k = 1:size(t, 1),
                
                sc = sc + (a(k) * ((t(k, 3) * F(t(k, 1))) < (t(k, 3) * t(k, 2))));

            end

            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            if sc > Cparams.thresh
                index          = index + 1;
                detection      = [j i W H];
                dets(index, :) = detection(:);
            end
            
        end 
    end
    
    % shrinking the matrix
    dets = dets(1:index, :);

end