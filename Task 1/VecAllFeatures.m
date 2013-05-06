
function fmat = VecAllFeatures(all_ftypes, W, H)

	fmat = zeros(W * H, size(all_ftypes(1)));
	
	for i = 1:size(all_ftypes, 1),
	
		fmat(:, i) = VecFeature(all_ftypes(i, :), W, H);
	
	end

end