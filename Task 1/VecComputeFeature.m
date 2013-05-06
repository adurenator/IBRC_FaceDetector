
function fs = VecComputeFeature(ii_ims, ftype_vec)

	% check matrix sizes so the result is correct
	fs = ii_ims' * ftype_vec;

end