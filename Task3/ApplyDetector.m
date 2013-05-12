
function sc = ApplyDetector(Cparams, ii_im)
    
    sc = 0;
    a = Cparams.alphas;
    t = Cparams.Thetas; % each row [j, theta, p]
    F = ii_im(:)' * Cparams.fmat(:, 1:Cparams.numFeatures);
    
    for i = 1:size(t, 1),
        
        sc = sc + (a(i) * ((t(i, 3) * F(t(i, 1))) < (t(i, 3) * t(i, 2))));
        
    end
    
end