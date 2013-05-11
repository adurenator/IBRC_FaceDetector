
function sc = ApplyDetector(Cparams, ii_im)
    
    sc = 0;
    size(ii_im)
    size(Cparams.fmat)
    w = Cparams.alphas;
    t = Cparams.Thetas; % each row [j, theta, p]
    F = Cparams.fmat(:, t(:, 1))' * ii_im;
    
    for i = 1:length(t),
        
        % sum(1 to T) alpha_t * h(f; Theta_t)
        sc = sc + w(i) * ((t(i, 2) * F(i)) < (t(i, 2) * t(i, 3)));
        
    end
    
end