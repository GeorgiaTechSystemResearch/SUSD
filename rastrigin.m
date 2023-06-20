function z = rastrigin(x, min)
    % Rastrigin test function with min at ___
    % - obj functions must take dxN matrices (each column is a d-dimension
    %   agent) and produce a 1xN row vector (each column is the evaluation)
    
    %find the dimensions and number of agents for x
    if nargin < 2 || isempty(min)
        min = 0;
    end
    [d,N] = size(x);
    z = zeros(1,N);
    xnew = x - min;
    for j=1:N
        v = xnew(:,j);
        for i=1:d
            z(j) = z(j) + v(i).^2 - 10 * cos (2 * pi * v(i)) + 10;
        end
    end
end
