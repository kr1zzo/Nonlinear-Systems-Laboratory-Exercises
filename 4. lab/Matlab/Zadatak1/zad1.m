%% 1. Zadatak

clear all;
close all;

% Parametri
Ks = 1.61;
Jh = 0.0021;
m = 0.4;
g = - 9.81;
h = 0.06;
Km = 0.00767;
Jl = 0.0059;
Rm = 2.6;
Kg = 70;

%% a) 

Tsim = 15;

% Polovi
p = [-3+1i -3-1i -35 -35];

% Linearizacija
[A, B, C, D] = linmod('zad1_model_for_linearization')

% Matrica
A = [0 0 1 0; 0 0 0 1; 0 766.6667 -52.7952 0; -39.9051 -1079.4531 52.7952 0];
B = [0; 0; 98.3333; -98.3333];
C = [1 1 0 0];
D = 0;

% Prijenosna funkcija


syms s;
s = tf('s');

Gp = C*(inv(s*I - A))*B + D;
[num, den] = tfdata(Gp);
num = cell2mat(num);
den = cell2mat(den);

% Prefiltar
pf = 1;

% Simulacija
u = 1;
simulation = sim('zad1_model.mdl');

% Plot
figure(1);
plot(simulation.tout, simulation.y_nonLinear);
hold on;
plot(simulation.tout, simulation.y_linear);
title('Usporedba odziva nelinearnog i lineariziranog sustava');
xlabel('t [s]');
ylabel('y(t)');
legend('Nelinearni sustav', 'Linearizirani sustav', Location='best');
grid();

%% b) 

% Polovi
p = [-50, -50, -3+1i, -3-1i];

% Pojacanje po Ackermanu
K = acker(A,B,p)

% Prijenosna funkcija
Gp = (C - D*K)*((s*I - A + B*K)^(-1))*B + D;
[num, den] = tfdata(Gp);
num = cell2mat(num);
den = cell2mat(den);

% Prefiltar
syms sx
Gpx = (C - D*K)*((sx*I - A + B*K)^(-1))*B + D;
pf = double(subs(Gpx, sx, 0));

% Simulacija
simulation = sim('zad1_model.mdl');

% Plot
figure(2);
plot(simulation.tout, simulation.y_nonLinear);
hold on;
plot(simulation.tout, simulation.y_linear);
title('Usporedba odziva nelinearnog i lineariziranog sustav');
xlabel('t [s]');
ylabel('y(t)');
legend('Nelinearni sustav', 'Linearizirani sustav', Location='best');
grid();
