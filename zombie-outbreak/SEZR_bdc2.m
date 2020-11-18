% Viral zombie epidemic with latent infection and air-spreaded cure (SEZR+bdc2)
function dx=SEZR_bdc2(t,x)
% ---- States/classes ----
% dx(1) - Susceptiple population
% dx(2) - Exposed population
% dx(3) - Zombie population
% dx(4) - Removed population
% dx(5) – Military personel
%
% ---- Process parameters ----
alpha = 0.49;
beta = 0.59;
zeta = 2;
delta = 0.005;
lambda = 0.005;
epsilon = 30;
mu = 30;
time_for_cure = 11.1;

% ---- Process parameters ----
% alpha – destruction of zombies by susceptible(s) (failed encounter for a zombie)
% beta – infection of susceptible by a zombie (failed encounter for a susceptible)
% zeta – disease outbreak (exposed individual turns into a zombie)
% delta – natural death or suicide of susceptible
% lambda – birth of the new individual
% epsilon – successful treatment of exposed individual
% mu – succesful treatment of zombie
% time_for_cure - time when the cure is invented and made available

% Initiate a vector of zeros to update state values.
dx = zeros (4, 1);

dx(1) = x(1)*lambda - beta*x(1)*x(3) - delta*x(1) + cure(t,time_for_cure)*x(2)*epsilon + cure(t,time_for_cure)*x(3)*mu;
dx(2) = beta*x(1)*x(3) - zeta*x(2) - cure(t,time_for_cure)*x(2)*epsilon;
dx(3) = zeta*x(2) - alpha*x(1)*x(3) - cure(t,time_for_cure)*x(3)*mu;
dx(4) = alpha*x(1)*x(3) + x(1)*delta;
endfunction
