clear all;
close all;

% No of agents
N = 50;

% dimension of problem
d = 50;

% randomly generate the starting positions of all agents
mu = zeros(d,1);
sigma = 1;
x0 = mu + sigma*randn(d,N);

% search for a solution of quadratic problem with SUSD
tic;
[xmin, fmin, iter] = susd_exp_search(x0,@quadratic,0.01,50,200);
T = toc;

fprintf("fmin = %.3f in %i iterations\n", fmin, iter)
fprintf("Search took %.3f seconds\n", T);