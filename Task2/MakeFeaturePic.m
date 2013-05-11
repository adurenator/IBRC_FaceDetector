%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Project: make feature pic function 
% Autor  : Álvaro Peiró
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Use: Create a matrix, fpic, of zeros of size (H, W). From the information
%      of its ftype, set the appropiate pixels to 1 and to -1
% Input: · ftype: information of de feature vector (type and dimensions).
%        · W, H:  width and height of the image.
% Output:  fpic:  matrix with the graphic values of the feature vector.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function fpic = MakeFeaturePic(ftype, W, H)

    fpic = zeros(H, W);
    
    % Look for the feature type
    x = ftype(2); y = ftype(3); 
    w = ftype(4); h = ftype(5);
    switch ftype(1)
        case 1
            fpic(y:y+h-1, x:x+w-1) = -ones(h, w);
            fpic(y+h:y+2*h-1, x:x+w-1) = ones(h, w);
        case 2
            fpic(y:y+h-1, x:x+w-1) = ones(h, w);
            fpic(y:y+h-1, x+w:x+2*w-1) = -ones(h, w);
        case 3
            fpic(y:y+h-1, x:x+w-1) = ones(h, w);
            fpic(y:y+h-1, x+w:x+2*w-1) = -ones(h, w);
            fpic(y:y+h-1, x+2*w:x+3*w-1) = ones(h, w);
        case 4
            fpic(y:y+h-1, x:x+w-1) = ones(h, w);
            fpic(y:y+h-1, x+w:x+2*w-1) = -ones(h, w);
            fpic(y+h:y+2*h-1, x:x+w-1) = -ones(h, w);
            fpic(y+h:y+2*h-1, x+w:x+2*w-1) = ones(h, w);
    end

end
