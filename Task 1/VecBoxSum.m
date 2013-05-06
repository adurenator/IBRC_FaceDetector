
function b_vec = VecBoxSum(x, y, w, h, W, H)

	b_vec = zeros(H, W);
    %limitY = y + h - 1;
    %limitX = x + w - 1;
	%b_vec(y:limitY, x:limitX) = 1;
    b_vec(y + h - 1, x + w - 1) = 1;
    b_vec(y - 1, x - 1)         = 1;
    b_vec(y + h - 1, x - 1)     = -1;
    b_vec(y - 1, x + w - 1)     = -1;
	b_vec = b_vec(:);

end