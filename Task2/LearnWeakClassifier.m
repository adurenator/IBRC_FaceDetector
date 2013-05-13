
function [theta, p, err] = LearnWeakClassifier(ws, fs, ys, j)

    feature = fs(:, j);
    aux     = ws .* feature;
    aux1    = (1 - ys);
    
    % weighted mean for positive examples
    p_mean = (aux' * ys) / (ws' * ys);
   
    % weighted mean for negative examples
    n_mean = (aux' * aux1) / (ws' * aux1);
    
    % threshold
    theta = 0.5 * (p_mean + n_mean);
    
    aux2 = abs(ys - (-feature < -theta));
    aux3 = abs(ys - (feature < theta));
    
    % error parity -1
    err_1 = ws' * aux2;
    
    % error parity 1
    err1 = ws' * aux3;
    
    % get the output values acording to the min error
    if err_1 < err1
        p   = -1;
        err = err_1;
    else
        p   = 1;
        err = err1;
    end
    
end