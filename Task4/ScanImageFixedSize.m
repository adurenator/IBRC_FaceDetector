
function dets = ScanImageFixedSize(Cparams, im)

    % detect whether the image is grayscale
    if size(im, 3) > 1
        im = double(rgb2gray(im));
    end
    
    % Normalize the image
    %im = (im - mean(im(:))) / (std(im(:)) + (10^-12));
    
    % Integral image
    %ii_im  = cumsum(cumsum(im, 1), 2);
    %ii_im2 = ii_im .* ii_im;
    
    % Sub-window size
    W  = 19;
    H  = 19;
    %L2 = W * W;
    %WH = W * H;
    
    % sub-wimdows index limits
    row = size(im, 1) - (H - 1);
    col = size(im, 2) - (W - 1);
    
    % sparse fmat
    pfmat = sparse(Cparams.fmat(:, 1:Cparams.numFeatures));
    
    % auxiliar variables
    a = Cparams.alphas;
    t = Cparams.Thetas; % each row [j, theta, p]
    
    % memory reservation for speeding
    dets  = zeros(row * col, 4);
    index = 1;
    
    % Checking all sub-windows
    for i = 1:row,
        for j = 1:col,
            
            %sc = ApplyDetector2(Cparams, ii_im, j, i, W, H);
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            ii1    = im(i:i + (H - 1), j:j + (W - 1));
            ii1    = (ii1 - mean(ii1(:))) / (std(ii1(:)) + (10^-12));
            ii_im1 = cumsum(cumsum(ii1, 1), 2);
            
            F      = ii_im1(:)' * pfmat;
            sc     = 0;
    
            for k = 1:size(t, 1),

                sc = sc + (a(k) * ((t(k, 3) * F(t(k, 1))) < (t(k, 3) * t(k, 2))));

            end

            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            if sc > Cparams.thresh
                detection      = [j i W H];
                dets(index, :) = detection(:);
                index          = index + 1;
            end
            
        end 
    end
    
    % shrinking the matrix
    dets = dets(1:index-1, :);

end