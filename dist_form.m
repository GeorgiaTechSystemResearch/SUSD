function [u] = dist_form(d0,x,k)
    % implementation of distance based formation controller
    u = zeros(size(x,1),size(x,2));
    N = size(x,2);
    
    % compute the formation term
    for i=1:N
        x_ = x; x_(:,i) = [];
        dif = x_ - x(:,i);
        d = vecnorm(dif);
        %u(:,i) = k*sum((d-d0).*dif./(d.^2),2);
        u(:,i) = k*sum((d-d0).*dif,2);
    end
end

