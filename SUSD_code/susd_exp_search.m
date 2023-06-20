function [xmin,fmin,iter] = susd_search(x0,obj_fun,epsilon,eps_window,max_iter)
    % implementation of the SUSD search method detailed in LCSS submission
    % - x0: initial state as R^{dxN} for N agents of d dimension
    % - obj_fun: function handle for the objective function
    % - epsilon: stopping criteria epsilon (variance in moving window drops below epsilon)
    % - eps_window: moving window size for epsilon
    % - max_iter: maximum number of iterations to search for
    
    x = x0;
    f = @(y,x) 1-exp(min(y)-y);

    cond = zeros(1,eps_window);
    for iter=1:max_iter
        % perform a search step
        [u,z] = susd(obj_fun,f,x,5);
        x = x + u;
        
        % check stopping condition
        cond = circshift(cond,-1);
        cond(1) = min(z);
        if var(cond) < epsilon; break; end
    end
    
    % find best estimate
    ff = obj_fun(x);
    [fmin,idx] = min(ff);
    xmin = x(:,idx);
end

