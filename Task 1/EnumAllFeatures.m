%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Project: enumerate all features function 
% Autor  : Álvaro Peiró
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Use: Enumerates all the possible features, giving a certain width and 
%      height of a image.  
% Input: · w, h:  width and height of image.
% Output:  all_ftypes     sum of the pixel values within the rectangular area
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function all_ftypes = EnumAllFeatures(W, H)

    % Preallocating fot the features;
    all_ftypes = zeros(4*(W*H*W*H), 5);
    
    index = 1;
    % Enumerating all I-type features...
    for w = 1:W-2,
       for h = 1:floor(H/2)-2,
            for x = 2:W-w,
                for y = 2:H-2*h,
                    all_ftypes(index, :) = [1 x y w h]; index = index + 1;
                end
            end
       end
    end
    
    % Enumerating all II-type features...
    for w = 1:floor(W/2)-2,
       for h = 1:H-2,
            for x = 2:W-2*w,
                for y = 2:H-h,
                    all_ftypes(index, :) = [2 x y w h]; index = index + 1;
                end
            end
       end
    end
    
    % Enumerating all III-type features...
    for w = 1:floor(W/3)-2,
       for h = 1:H-2,
            for x = 2:W-2*w,
                for y = 2:H-h,
                    all_ftypes(index, :) = [3 x y w h]; index = index + 1;
                end
            end
       end
    end
    
    % Enumerating all IV-type features...
    for w = 1:floor(W/2)-2,
       for h = 1:floor(H/2)-2,
            for x = 2:W-2*w,
                for y = 2:H-2*h,
                    all_ftypes(index, :) = [4 x y w h]; index = index + 1;
                end
            end
       end
    end

    % Trim the empty rows.
    all_ftypes(index:end, :) = [];
    
end