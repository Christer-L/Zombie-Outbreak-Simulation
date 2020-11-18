% Simplified model without latent infection (SZR)
function dx=SZR(t,x)
% ---- States/classes ----
% dx(1) - Susceptiple population
% dx(2) - Zombie population
% dx(3) - Removed population
%
% ---- Process parameters ----
% alpha – destruction of zombies by susceptible(s) (failed encounter for a zombie)
% beta – infection of susceptible by a zombie (failed encounter for a susceptible)
%
% Parameters for alpha and beta adopted from Table 1 of [13].
alpha = 0.49;
beta = 0.59;


% Initiate a vector of zeros to update state values.
dx = zeros (3, 1);

dx(1) = - beta*x(1)*x(2);
dx(2) = beta*x(1)*x(2) - alpha*x(1)*x(2);
dx(3) = alpha*x(1)*x(2);
endfunction
