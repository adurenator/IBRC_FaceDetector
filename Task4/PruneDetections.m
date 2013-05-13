%%
% Connects overlapping rectangular detections into bigger enclosing
% components (rectangles).
%
% dets: The detected rectangles on the form (x, y, w, h), stored as rows.
function fdets = PruneDetections(dets)

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

% Order the rectangles by components
fdets = [Inf*ones(S, 2) zeros(S, 2)];
% Calculate the average bounding box for each component
for i = 1:S
    fdets(i, 1:2) = [min(dets(:, 1)) min(dets(:, 2))];
    fdets(i, 3:4) = [max(dets(:, 1) + dets(:, 3))-fdets(i, 1)
                     max(dets(:, 2) + dets(:, 4))-fdets(i, 2)];
end

%{
% Order the rectangles by components
fdets = zeros(S, 4);
for i = 1:nd
    fdets(C(i), 1:2) = fdets(C(i), 1:2) + dets(i, 1:2);
    fdets(C(i), 3:4) = fdets(C(i), 3:4) + dets(i, 1:2) + dets(i, 3:4);
end
% Calculate the average bounding box for each component
for i = 1:S
    fdets(i, :) = fdets(i, :) / sum(C==i);
    fdets(i, 3:4) = fdets(i, 3:4) - fdets(i, 1:2);
end
%}

end
