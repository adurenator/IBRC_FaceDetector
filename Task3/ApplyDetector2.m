
function sc = ApplyDetector2(Cparams, ii_im, x, y)
    
    ii_im = ii_im(y:y + 18, x:x + 18);
    
    a = Cparams.alphas;
    t = Cparams.Thetas; % each row [j, theta, p]
    F = ii_im(:)' * Cparams.fmat(:, 1:Cparams.numFeatures);
    
    sc = 0;
    
    for i = 1:size(t, 1),
        
        sc = sc + (a(i) * ((t(i, 3) * F(t(i, 1))) < (t(i, 3) * t(i, 2))));
        
    end
    
end