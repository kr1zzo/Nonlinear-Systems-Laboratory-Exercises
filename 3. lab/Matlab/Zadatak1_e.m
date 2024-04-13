%% Zadatak 1
close all;
clear all;

K = 2;
Td = 0.4;
T1 = 0.2;
T2 = 0.3;

xa = 3;
omega_u = 1;
Um = 3;
Tsim = 30;

Gp = tf(K*[Td 1],[T1*T2 T1+T2 1 0]);

[num,den]=tfdata(Gp,"v");

%% c)

simulation = sim('model.mdl');

figure(1);
plot(simulation.tout, simulation.u);
hold on;
plot(simulation.tout, simulation.x);
title(strcat('u(t) vs x(t), Um = ', num2str(Um)));
xlabel('t [s]');
ylabel('u(t), x(t)');
legend('u(t)','x(t)');
grid();

Xm_simulation = max(simulation.x);

phi_simulation = 180/pi*acos(dot(simulation.u,simulation.x)/...
    (norm(simulation.u)*norm(simulation.x)));

disp('Xm_simulation:');
disp(Xm_simulation);
disp('phi_simulation: ');
disp(phi_simulation);