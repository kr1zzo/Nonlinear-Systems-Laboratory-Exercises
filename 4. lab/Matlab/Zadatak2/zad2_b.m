%% 2.) zadatak


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

Tsim = 5;

syms s;
s = tf('s');

%%

%u = 1;
%u = 10;
u = 100;
%% 1. b)

% Matrica
A = [0 0 1 0; 0 0 0 1; 0 766.6667 -52.7952 0; -39.9051 -1079.4531 52.7952 0];
B = [0; 0; 98.3333; -98.3333];
C = [1 1 0 0];
D = 0;

n = 4;
I = eye(n);

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
figure(1);
plot(simulation.tout, simulation.y_linear);
hold on;
%% 2. b)

konst = m*g*h/Jl;
g = [0 0 Kg*Km/(Jh*Rm) -Kg*Km/(Jh*Rm)]';
hx = [1 1 0 0];
beta = Ks*Kg*Km/(Jl*Jh*Rm);

% Polovi
p = [-3+1i -3-1i -35 -35 -50];

A = [0 1 0 0; 0 0 1 0; 0 0 0 1; 0 0 0 0];
B = [0 0 0 1]';
C = [1 0 0 0];

A_ = [A zeros(4,1); -C 0];
B_ = [B' 0]';

K = acker(A_, B_, p)
hold on;
simulation2 = sim('zad2_modell.mdl');

% Plot
hold on;
plot(tout1, y_pov_lin);
title('Usporedba modela linearizacije , u = ', u);
xlabel('t [s]');
ylabel('y(t)');
legend('Linearizirani sustav - postupak tangente i regulator (1.b)', 'Linearizirani sustav  - linearizacija u povratnoj vezi', Location='best');
grid();
hold off;
