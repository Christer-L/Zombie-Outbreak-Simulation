% Model of supernatural scenario with resurrection from dead (SDZR)
function dx=SDZR(t,x)
% ---- States/classes ----
% dx(1) - Susceptiple population
% dx(2) - Dead population
% dx(3) - Zombie population
% dx(4) - Removed population
%
% ---- Process parameters ----
% alpha – permanent destruction of zombies by susceptible(s)
% beta – death of a susceptic
% zeta – resurrection of a zombie from dead
% delta – natural death or suicide of susceptible
% lambda – birth of the new individual
%
% Parameters for alpha, beta, zeta adopted from Table 1 of [13].
alpha = 0.9;
beta = 1.1;
zeta = 3.6;
delta = 0.1;
lambda = 0.005;

% Initiate a vector of zeros to update state values.
dx = zeros (4, 1);

dx(1) = x(1)*lambda - beta*x(1)*x(3) - delta*x(1);
dx(2) = beta*x(1)*x(3) - zeta*x(2);
dx(3) = zeta*x(2) - alpha*x(1)*x(3);
dx(4) = alpha*x(1)*x(3) + x(1)*delta;
endfunction
