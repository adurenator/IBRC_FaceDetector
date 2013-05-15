%%
% Displays detected faces as red rectangles.
%
% dets: The rectangels on the form (x, y, w, h), stored as rows.
% c: The color of the detection rectangles.
% l: The width of the rectangle lines.
function DisplayDetections(dets, c, l, txt)

hold on

t = false;

if exist('txt', 'var')
    if strcmp(txt, 'text')
        t = true;
    end
end

% Display each rectangle
for i = 1:size(dets, 1)
    x = [dets(i, 1) dets(i, 1)+dets(i, 3)];
    y = [dets(i, 2) dets(i, 2)+dets(i, 4)];
    plot([x(1) x(1) x(2) x(2) x(1)], [y(1) y(2)-1 y(2)-1 y(1) y(1)], [c '-'], 'LineWidth', l)
    
    if t
        text(x(1), y(1), ['\bf w = ' num2str(dets(i, 5)) '\rm'], 'VerticalAlignment', 'bottom')
    end
end

end
