%%
% Scans a given image in different scales to detect more faces.
%
% Cparams: Parameters used for the face detection.
% im: The image to be scanned.
% min_s: The minimum scale factor.
% max_s: The maximum scale factor.
% step_s: The number of scalings between the minimum and maximum scale
%         factors.
function dets = ScanImageOverScale(Cparams, im, min_s, max_s, step_s)

% Define the set of scalings
scale = min_s : step_s : max_s;

dets = [];
for s = scale
    dets = [dets; ScanImageFixedSize(Cparams, imresize(im, s))/s];
end

end
