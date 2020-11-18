function dx=SEZR_mc(t,x)
% ---- States/classes ----
% dx(1) - Susceptiple population
% dx(2) - Exposed population
% dx(3) - Zombie population
% dx(4) - Removed population
% dx(5) – Military personel
%
% ---- Process parameters ----
alpha = 0.1;
beta = 0.8;
zeta = 0.9;
delta = 0.02;
lambda = 0.05;
epsilon = 3.0;
mu = 0.2;
phi = 0.2;
psi = 5;
tau = 1.7;
gamma = 0.5;
time_for_cure = 10;

% ---- Process parameters ----
% alpha – destruction of zombies by susceptible(s) (failed encounter for a zombie)
% beta – infection of susceptible by a zombie (failed encounter for a susceptible)
% zeta – disease outbreak (exposed individual turns into a zombie)
% delta – natural death or suicide of susceptible
% lambda – birth of the new individual
% epsilon – cure administration to exposed individual by military unit
% mu – successful cure administration to a zombie by military unit
% phi – failed encounter of zombies by a military unit
% psi – deployment of new units to the site
% tau – successful attack against zombie by military unit
% gamma – suicide or natural death of exposed individual
%
% time_for_cure - time when the cure is invented and made available

% Initiate a vector of zeros to update state values.
dx = zeros (5, 1);

dx(1) = x(1)*lambda - beta*x(1)*x(3) - delta*x(1) + cure(t,time_for_cure)*x(2)*x(5)*epsilon + cure(t,time_for_cure)*x(3)*x(5)*mu;
dx(2) = beta*x(1)*x(3) - zeta*x(2) - cure(t,time_for_cure)*x(2)*x(5)*epsilon + phi*x(5)*x(3) - gamma*x(2);
dx(3) = zeta*x(2) - alpha*x(1)*x(3) - cure(t,time_for_cure)*x(3)*x(5)*mu - (tau - cure(t, time_for_cure))*x(3)*x(5);
dx(4) = alpha*x(1)*x(3) + x(1)*delta + (tau - cure(t, time_for_cure))*x(3)*x(5) + gamma*x(2);
dx(5) = psi - phi*x(5)*x(3);
endfunction
