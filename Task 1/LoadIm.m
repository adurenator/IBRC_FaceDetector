%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Project: load data function 
% Autor  : Álvaro Peiró
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Use: Gets the filename of an image and returns the normalized version of 
%      the pixel data of the image and its integral image.      
% Input: · im_fname: filename of the image
% Output:  im:    normalized version of the pixel data.
%        · ii_im: integral image.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [im, ii_im] = LoadIm(im_fname)

    % 1 - Get the image and cast it to double.
    image = imread(im_fname);
    
    if (length(size(image)) == 3), image = double(rgb2gray(image)); 
    else image = double(image); end
    
    % 2 - Normalize the image. We add a small value to std in order to not
    %     to divide by zero.
    im = (image - mean(image(:)))/ (std(image(:)) + (10^-12));
    
    % 3 - COmpute the integral image
    ii_im = cumsum(cumsum(im, 1), 2);
    
end