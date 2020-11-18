% File for plotting graphs
clear all ; close all ; clc

% Set initial parameters according to model.
[t,x] = ode45(@SEZR_mc, [0,20], [508.29,1,0,0,30])
% [t,x] = ode45(@SEZR, [0,20], [508.29,1,0,0])

plot(t,x)
xlabel("time")
ylabel("population")

% Choose one depending on the amount of parameters and model used.
legend({"Susceptibles (S)", "Exposed (D)","Zombies (Z)", "Removed (R)", "Military (M)"}, "location", "eastoutside")
%legend({"Susceptibles (S)", "Exposed (D)","Zombies (Z)", "Removed (R)"}, "location", "eastoutside")
