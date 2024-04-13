%% Zadatak 3 : Simulacijska provjera

clear all;
close all;

%% a)

% Početni uvjeti
y0 = 2;
x0 = -1;

% Tablica 5 : Vrijednosti koefcijenata koji defniraju sustav.
C = 5;
T = 0.1;
a = 1;

tsim = 5;


open dvopolozajni_relej.slx
sim dvopolozajni_relej.slx


% 
figure(1);
hold on
subplot(3,1,1);
plot(t,x);
xlabel('\it{t}[s]');
ylabel('\itx(t)');
grid on
hold on
title("x(t)");

subplot(3,1,2);
plot(t,y);
xlabel('\it{t}[s]');
ylabel('\ity(t)');
grid on
hold on
title("y(t)");

subplot(3,1,3);
plot(t,yn);
xlabel('\it{t}[s]');
ylabel('\itY_{N}(t)');
grid on
hold on
title("Y_N(t)");

% Fazna trajektorija
figure(2)
plot(y,x);
ylabel('\ity(t)');
xlabel('\itx(t)');
grid on 
hold on
axis([-3 3 -6 6])
plot(y0, x0, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'red')
title('3. a) Fazna trajektorija stanja sustava ')

%% b)

% Početni uvjeti
y0 = 1;
x0 = 0;

% Parametri nelinearnog elementa
C = 20;
a = 0.2;

open tropolozajni_relej.slx
sim tropolozajni_relej.slx


figure(3)
plot(y,x);
ylabel('\ity(t)');
xlabel('\itx(t)');
grid on 
hold on
axis([-1 1.5 -14 8])
plot(y0, x0, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'red')
title('3. b) Fazna trajektorija stanja sustava')
