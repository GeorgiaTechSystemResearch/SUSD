function [f] = schwefel(x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% SCHWEFEL FUNCTION
% INPUT:
% compute function for each agent
% x = [x11, x21, ..., xn1]
%     [x12, x22, ..., xn2]
%     [..., ..., ..., ...]
%     [x1d, x2d, ..., xnd]
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if nargin < 2 || isempty(min)
    min = 0;
end
[d,n] = size(x);
%disp("d:" + d);
%disp("n:" + n);
f = ones(1,n);  
xnew = x - min;
for j=1:n
    v = transpose(xnew(:,j));
    %disp(v);
    sum = 0;
    %disp("start");
    for ii = 1:d
        vi = v(ii);
        sum = sum + vi*sin(sqrt(abs(vi)));
        %disp("sum:" + sum);
    end
    %disp("end");
    f(j) = 418.9829*d - sum;
    %disp("y:" + f(ii));
end
%disp(f);
end