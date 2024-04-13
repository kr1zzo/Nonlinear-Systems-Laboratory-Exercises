%% 1. Zadatak b)
clear all;
close all;
% Zadani parametri
K = 2;
Td = -0.4;
T1 = 0.2;
T2 = 0.3;
omega_u = 1;

% Prijenosna funkcija
Gp = tf(K*[Td 1],[T1*T2 T1+T2 1 0]);

xa = 3;
omega_u = 1;
Um = 10;
lab4(Gp, xa, omega_u, Um)


