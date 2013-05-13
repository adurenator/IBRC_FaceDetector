
function LoadSaveImData(dirname, ni, im_sfn)
    
	face_fnames = dir(dirname);
	aa          = 3:length(face_fnames);
	a           = randperm(length(aa));
	fnums       = aa(a(1:ni));
	
	ii_ims = [];
	
	for i = 1:ni,
		[im, ii_im] = LoadIm([dirname, face_fnames(fnums(i)).name]);
		ii_ims      = [ii_ims; ii_im(:)'];
    end
    
	save(im_sfn, 'dirname', 'fnums', 'ii_ims');

end