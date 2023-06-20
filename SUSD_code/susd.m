function [u,z_] = susd(obj_fun,f,x,k)
    % implementation of SUSD with function mapping f
    persistent nold
    
    % compute the eigenvectors/SUSD direction
    umean = mean(x,2);
    R_u = x - repmat(umean, 1,size(x,2));
    cov = R_u*R_u';
    [eig_vec, eig_val] = eig(cov);
    n = eig_vec(:,1);
    q = eig_vec(:,2);
    
    % check for switching
    if isempty(nold); nold = n; end
    n = n*sign(n'*nold);
    nold = n;
    
    % get function evaluation
    z = obj_fun(x);
    
    z_ = f(z,x);
    %z_=z_./(max(z_)).*(1-exp(-z_));
    %zavg=(1/size(z,2))*z_*ones(size(z,2),1);
%      [zbar, ~]=min(z_);
%       z_=1-exp(zbar-z_);
    
    % compute input
    %L=(eig_val(2,2)-eig_val(1,1))/(eig_val(2,2)+eig_val(1,2));
    u = k.*z_.*n;
end

