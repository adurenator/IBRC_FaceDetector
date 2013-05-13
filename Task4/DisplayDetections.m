%%
% Displays detected faces as red rectangles.
%
% im: The analyzed image.
% dets: The rectangels on the form (x, y, w, h), stored as rows.
function DisplayDetections(im, dets)

% Display the image
imshow(im)
axis equal
hold on

% Display each rectangle
for i = 1:size(dets, 1)
    x = [dets(i, 1) dets(i, 1)+dets(i, 3)];
    y = [dets(i, 2) dets(i, 2)+dets(i, 4)];
    plot([x(1) x(1) x(2) x(2) x(1)], [y(1) y(2)-1 y(2)-1 y(1) y(1)], 'r-')
end

end
