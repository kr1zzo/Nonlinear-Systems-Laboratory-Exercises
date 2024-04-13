%% 2. Zadatak b)
clear all;
close all;
% Zadani parametri
K = 2;
Td = 0.4;
T1 = 0.2;
T2 = 0.3;
Tsim = 30;

% Prijenosna funkcija
Gp = tf(K*[Td 1],[T1*T2 T1+T2 1 0]);

[num,den]=tfdata(Gp,"v");

xa = 3;
omega_u = 20;
Um = 3;
%lab4(Gp, xa, omega_u, Um)

y_stac = [];

for i = 1:20

    value = i;
    simulation = sim('model.mdl');
    y_stac = [simulation.y(end) y_stac];

end

figure(3);
hold on;
grid();
plot((1:20),wrev(y_stac)./(1:20),'bx','LineWidth',1)
title('Pojačanje zatvorenog kruga u odnosu na iznos ulaznog signala');
xlabel('u(t) = step(t)');
ylabel('y(t)');
hold off;