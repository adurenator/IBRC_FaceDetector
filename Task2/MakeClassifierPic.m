%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Project: make classifier pic function 
% Autor  : Álvaro Peiró
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Use: Create a matrix, cpic, of zeros of size (H, W). Given a chosen set
%      of chosen features and its weights (conformed by the weight alpha
%      and the ps value) sets the aproppiate pixels as a weight sum of the
%      results of MakeFeaturePic for each given featured vector to make the
%      graphic values of the classifier.
% Input: · all_ftypes: all the possible feature vector for the dimensions
%                      HxW.
%        · chosen_f:   idexes of the chosen feeatured vectors inside
%                      all_ftypes.
%        · alphas, ps: weights and ps values for each chosen featured
%                      vector.
%        · W, H:  width and height of the image.
% Output:  cpic:  matrix with the graphic values of the classfier.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Values for the comprobation of the manual: chosen_f = [10562, 25985];

function cpic = MakeClassifierPic(all_ftypes, chosen_f, alphas, ps, W, H)

    cpic = zeros(H, W);
    
    for i=1:length(chosen_f),
        fpic = MakeFeaturePic(all_ftypes(chosen_f(i), :), W, H);
        cpic = cpic + alphas(i) * ps(i) * fpic; 
    end

end
