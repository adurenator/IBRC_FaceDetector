
function sc = ApplyDetector(Cparams, ii_im)
    
    sc = 0;
    
    w = Cparams.alphas;
    t = Cparams.Thetas; % each row [j, p, theta]
    F = Cparams.fmat(:, t(:, 1))' * ii_im;
    
    for i = 1:lenght(t),
        
        % sum(1 to T) alpha_t * h(f; Theta_t)
        sc = sc + w(i) * ((t(i, 2) * F(i)) < (t(i, 2) * t(i, 3)));
        
    end
    
end