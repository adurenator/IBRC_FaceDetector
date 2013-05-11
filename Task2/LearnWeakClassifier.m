
function [theta, p, err] = LearnWeakClassifier(ws, fs, ys, j)
%{
    pos = find(ys ~= 0);
    neg = find(ys == 0);
    
    % positive features
    pf = fs(pos);
    % negative features
    nf = fs(neg);
    
    % positive weights
    pw = ws(pos);
    % negative weights
    ng = ws(neg);
    
    % positive labels
    py = ys(pos);
    % negative labels
    ny = ys(neg);
 %}   
    aux  = ws .* fs;
    aux1 = (1 - ys);
    % weighted mean for positive examples
    p_mean = (aux' * ys) / (ws' * ys);
    % weighted mean for negative examples
    n_mean = (aux' * aux1) / (ws' * aux1);
    
    % threshold
    theta = 0.5 * (p_mean + n_mean);
    
    % error parity -1
    
    % error parity 1
    
    
    
end