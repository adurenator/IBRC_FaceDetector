
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ComputeFeature
%	Extracts the feature defined by ftype from each integral
%   image defined in ii_ims
%
% Input:
%	ii_ims -> cell array where each cell is a integral image
%	ftype  -> vector that defines the feature to extract
% Output:
%	fs     -> array of 1xlength(ii_ims) where each position i
%	          is the feature defined by ftype of the integral
%	          image i
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function fs = ComputeFeature(ii_ims, ftype)

	fs    = zeros(1, length(ii_ims));
	funcs = {'FeatureTypeI', 'FeatureTypeII', 'FeatureTypeIII', 'FeatureTypeIV'};
	
	for i = 1:length(ii_ims),
		
		% calls to a different function (eg. FeatureTypeI or FeatureTypeII or .. ) depending on
		% the value of ftype(1), that is the value that says which function to call
		fs(i) = feval(funcs{ftype(1)}, ftype(2), ftype(3), ftype(4), ftype(5));
		
	end

end