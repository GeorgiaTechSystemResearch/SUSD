function [xmin,fmin,iter] = susd_search(x0,obj_fun,z_des,max_iter)
    % implementation of the SUSD search method
    % - x0: initial state as R^{dxN} for N agents of d dimension
    % - obj_fun: function handle for the objective function
    % - epsilon: stopping criteria epsilon (variance in moving window drops below epsilon)
    % - eps_window: moving window size for epsilon
    % - max_iter: maximum number of iterations to search for
    
    x = x0;
    f = @(y,x) y;

    for iter=1:max_iter
        % perform a search step
        [u,z] = susd(obj_fun,f,x,1);
        x = x + u + dist_form(5/iter,x,0.1);
        
        % check stopping condition
        if min(z) < z_des; break; end
    end
    
    % find best estimate
    ff = obj_fun(x);
    [fmin,idx] = min(ff);
    xmin = x(:,idx);
end

