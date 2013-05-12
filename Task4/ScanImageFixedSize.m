
function dets = ScanImageFixedSize(Cparams, im)

    % detect whether the image is grayscale
    if size(im, 3) > 1
        im = double(rgb2gray(im));
    end
    
    % Normalize the image
    im = (im - mean(im(:))) / (std(im(:)) + (10^-12));
    
    % Integral image
    ii_im = cumsum(cumsum(im, 1), 2);
    
    % Sub-window size
    W = 19;
    H = 19;
    
    % sub-wimdows index limits
    row = size(ii_im, 1) - (H - 1);
    col = size(ii_im, 2) - (W - 1);
    
    dets = [];
    % Checking all sub-windows
    for i = 1:row,
        for j = 1:col,
            
            sc = ApplyDetector2(Cparams, ii_im, col, row, W, H);
            if sc > Cparams.thresh
                detection = [col row W H];
                dets = [dets; detection];
            end
            
        end 
    end

end