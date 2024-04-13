%% 1. Zadatak : Chuin krug

clear all;
close all;


%% b) Tablica 2: Iznosi koecijenata i po£etnih uvjeta (bezdimenzijski)

C1 = 1/9;
C2 = 1;
L = 1/7;
R = 1/0.7;

m0 = -0.5;
m1 = -0.8;
m2 = 0.8;
Bp1 = 1;
Bp2 = 4;

iL0 = 0.7;
UC10 = -0.1;
UC20 = 0.5;

tsim= 500;
 
%% c) 

% Korištenjem funkcije plot3 prikažite, uz ozna£avanje osi i naslova slike, trajektoriju stanja sustava u
% prostoru {iL, uC1, uC2}.

x = [-6.875, -4, -1, 1, 4, 6.875];
y = [-0, 2.3, 0.8, -0.8, -2.3, 0];


open chuin_krug_model
sim chuin_krug_model

figure(1);
plot3(iL,uC1,uC2);
title('1. c)')

xlabel('i_L(t)')
ylabel('u_c_1 (t)')
zlabel('u_c_2 (t)')

grid on 
hold on

plot3(iL0, UC10, UC20, 'ro', 'MarkerSize', 3)

%% d) 

% Korištenjem funkcije plot3 prikažite, uz ozna£avanje osi i naslova slike, trajektoriju stanja sustava u
% prostoru {iL, uC1, uC2} uz promijenjene parametre it tablice 3

% Tablica 3 
iL0 = 3;
UC10 = -0.1;
UC20 = 0.6;

open chuin_krug_model
sim chuin_krug_model

figure(2);
plot3(iL, uC1, uC2);
title('1.d)')

xlabel('i_L(t)')
ylabel('u_c_1 (t)')
zlabel('u_c_2 (t)')

grid on 
hold on

plot3(iL0,UC10,UC20,'ro','MarkerSize',3)

%% e) 

% % Korištenjem funkcije plot3 prikažite, uz ozna£avanje osi i naslova slike, trajektoriju stanja sustava u
% prostoru {iL, uC1, uC2} uz promijenjene parametre it tablice 4

% Prema podacima tablice 4 dobivaju se nove točke nelinearnog elementa:
x = [-8, -4, 0, 4, 8];
y = [0, 3.2, 0, -3.2, 0];

open chuin_krug_model
sim chuin_krug_model

figure(3);
plot3(iL,uC1,uC2);
title('1.e)')

xlabel('i_L(t)')
ylabel('u_c_1 (t)')
zlabel('u_c_2 (t)')

grid on 
hold on

plot3(iL0,UC10,UC20,'ro','MarkerSize',3)
