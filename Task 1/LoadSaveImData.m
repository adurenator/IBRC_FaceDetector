
function LoadSaveImData(dirname, ni, im_sfn)
    
	face_fnames = dir(dirname);
	aa          = 3:length(face_fnames);
	a           = randperm(length(aa));
	fnums       = aa(a(1:ni));
	
	ii_ims = [];
	
	for i = 1:ni,
		aux    = LoadIm([dirname, face_fnames(fnums(i)).name]);
		ii_ims = [ii_ims aux(:)];
	
	end
	
	save(im_sfn, 'dirname', 'fnums', 'ii_ims');

end