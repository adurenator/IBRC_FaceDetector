
function sc = ApplyDetector2(Cparams, ii_im, x, y, W, H)
    
    ii_im = ii_im(y:y + (H - 1), x:x + (W - 1));
    
    a = Cparams.alphas;
    t = Cparams.Thetas; % each row [j, theta, p]
    F = ii_im(:)' * Cparams.fmat(:, 1:Cparams.numFeatures);
    
    sc = 0;
    
    for i = 1:size(t, 1),
        
        sc = sc + (a(i) * ((t(i, 3) * F(t(i, 1))) < (t(i, 3) * t(i, 2))));
        
    end
    
end