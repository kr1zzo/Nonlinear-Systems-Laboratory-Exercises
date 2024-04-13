%% Zadatak 2
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

%% a)

y_stac = [];

for i = 1:20

    value = i;
    simulation = sim('model.mdl');
    y_stac = [simulation.y(end) y_stac];

end

figure(1);
hold on;
grid();
plot((1:20),wrev(y_stac)./(1:20),'bx','LineWidth',1)
title('Pojačanje zatvorenog kruga u odnosu na iznos ulaznog signala');
xlabel('u(t) = step(t)');
ylabel('y(t)');
hold off;
