%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Project: feature type IV function 
% Autor  : Álvaro Peiró
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Use: Computes the feature type IV using the integral image.    
% Input: · ii_im: the integral image.
%        · x, y:  coordinates of the upper left border of the box
%        · w, h:  width and height of the feature.
% Output:  f:     result of the feature.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function f = FeatureTypeIV(ii_im, x, y, w, h)

    f = - ComputeBoxSum(ii_im, x, y, w, h) ...
                + ComputeBoxSum(ii_im, x, y+h, w, h) ...
                + ComputeBoxSum(ii_im, x+w, y, w, h) ...
                - ComputeBoxSum(ii_im, x+w, y+h, w, h);
    
end