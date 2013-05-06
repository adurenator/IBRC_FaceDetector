%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Project: compute box sum function 
% Autor  : Álvaro Peiró
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Use: Computes the sum of the pixel values within a 
%      rectangular area using the integral image.    
% Input: · ii_im: the integral image.
%        · x, y:  coordinates of the upper left border of the box
%        · w, h:  width and height of the rectangular area.
% Output:  A:     sum of the pixel values within the rectangular area
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function A = ComputeBoxSum(ii_im, x, y, w, h)

    A = ii_im(y + h-1, x + w-1) - ii_im(y + h-1, x-1) ...
                                - ii_im(y-1, x + w-1) ...
                                + ii_im(y-1, x-1);
    
end