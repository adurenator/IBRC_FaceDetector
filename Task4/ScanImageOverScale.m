%%
% Scans a given image in different scales to detect more faces.
%
% Cparams: Parameters used for the face detection.
% im: The image to be scanned.
% min_s: The minimum scale factor.
% max_s: The maximum scale factor.
% step_s: The number of scalings between the minimum and maximum scale
%         factors.
function dets = ScanImageOverScale(Cparams, FTdata, im, min_s, max_s, step_s)

% Define the set of scalings
scale = min_s : step_s : max_s;

dets = [];
for s = scale
    dets = [dets; ScanImageFixedSize(Cparams, FTdata, imresize(im, s))/s];
end

end
