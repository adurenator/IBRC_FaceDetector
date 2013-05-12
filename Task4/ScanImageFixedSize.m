
function dets = ScanImageFixedSize(Cparams, im)

    % detect whether the image is grayscale
    if ndim(im) > 2
        im = rgb2gray(im);
    end
    
    % Normalize the image
    im = (image - mean(image(:))) / (std(image(:)) + (10^-12));
    
    % Integral image
    ii_im = cumsum(cumsum(im, 1), 2);
    
    % Sub-window size
    L = 19;
    
    % sub-wimdows index limits
    row = size(ii_im, 1) - L;
    col = size(ii_im, 2) - L;
    
    % Checking all sub-windows
    for i = 1:row
        
        for j = 1:col
            
            f1 = [1 ];
            f2 = [2 ];
            f3 = [3 ];
            f4 = [4 ];
            f5 = [5 ];
            
            v1 = VecComputeFeature(ii_im, f1);
            v2 = VecComputeFeature(ii_im, f2);
            v3 = VecComputeFeature(ii_im, f3);
            v4 = VecComputeFeature(ii_im, f4);
            v5 = VecComputeFeature(ii_im, f5);
            
        end
        
    end

end