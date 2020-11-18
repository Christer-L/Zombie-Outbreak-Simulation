% Simplified SEZR model without births and natural deaths (SEZR+d)
function dx=SEZR_d(t,x)
% ---- States/classes ----
% dx(1) - Susceptiple population
% dx(2) - Exposed population
% dx(3) - Zombie population
% dx(4) - Removed population
%
% ---- Process parameters ----
% alpha – destruction of zombies by susceptible(s) (failed encounter for a zombie)
% beta – infection of susceptible by a zombie (failed encounter for a susceptible)
% zeta – disease outbreak (exposed individual turns into a zombie)
% delta – natural death or suicide of susceptible
%
% Parameters for alpha, beta, zeta adopted from Table 1 of [13].
alpha = 0.49;
beta = 0.59;
zeta = 2;
delta = 0.03;

% Initiate a vector of zeros to update state values.
dx = zeros (4, 1);

dx(1) = - beta*x(1)*x(3) - delta*x(1);
dx(2) = beta*x(1)*x(3) - zeta*x(2);
dx(3) = zeta*x(2) - alpha*x(1)*x(3);
dx(4) = alpha*x(1)*x(3) + x(1)*delta;
endfunction
