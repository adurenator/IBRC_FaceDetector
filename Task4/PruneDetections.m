%%
% Connects overlapping rectangular detections into bigger enclosing
% components (rectangles).
%
% dets: The detected rectangles on the form (x, y, w, h), stored as rows.
% type: The type of enclosing rectangle;
%   'bounding-box': An enclosing rectangle containing all sub rectangles.
%   'average': An average rectangle based on the position and size of all
%              sub rectangles.
function fdets = PruneDetections(dets, type)

% Number of detections
nd = size(dets, 1);

% An overlap matrix for all detections
D = zeros(nd);

for i = 1:nd
    for j = i:nd
        D(i, j) = rectint(dets(i, :), dets(j, :)) > 0;
        D(j, i) = D(i, j);
    end
end

% Find the intersecting components
[S, C] = graphconncomp(sparse(D));

if strcmp(type, 'bounding-box')
    % Order the rectangles by components
    fdets = [Inf*ones(S, 2) zeros(S, 3)];
    % Calculate the average bounding box for each component
    for c = 1:S
        fdets(c, 1:2) = [min(dets(C==c, 1)) min(dets(C==c, 2))];
        fdets(c, 3:4) = [max(dets(C==c, 1) + dets(C==c, 3))-fdets(c, 1)
                            max(dets(C==c, 2) + dets(C==c, 4))-fdets(c, 2)];
        % Calculate the weights
        fdets(c, 5) = size(dets(C==c, 1), 1);
    end
elseif strcmp(type, 'average')
    % Order the rectangles by components
    fdets = zeros(S, 5);
    for i = 1:nd
        fdets(C(i), 1:2) = fdets(C(i), 1:2) + dets(i, 1:2);
        fdets(C(i), 3:4) = fdets(C(i), 3:4) + dets(i, 1:2) + dets(i, 3:4);
    end
    % Calculate the average bounding box for each component
    for i = 1:S
        fdets(i, :) = fdets(i, :) / sum(C==i);
        fdets(i, 3:4) = fdets(i, 3:4) - fdets(i, 1:2);
        % Calculate the weights
        fdets(i, 5) = size(dets(C==i, 1), 1);
    end
end

end
