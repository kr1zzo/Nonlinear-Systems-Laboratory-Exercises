%% Drugi zadatak

% Zadani parametri
K = 2;
Td = 0.4;
T1 = 0.2;
T2 = 0.3;

% Prijenosna funkcija
Gp = tf(K*[Td 1],[T1*T2 T1+T2 1 0]);

xa = 3;
omega_u = 1;
Um = 10;

Tsim = 50;

%% a) zadatak

omega_u = 1;
Um = 10;

y_stac = [];

for i = 1:20

    step_value = i;
    simulation = sim('model.mdl');
    y_stac = [simulation.y(end) y_stac];

end

figure(1);
hold on;
grid();
plot((1:20), wrev(y_stac), 'rx')
title('Ovisnost statičkog pojačanja o iznosu ulaznog signala');
xlabel('Iznos ulaznog signala');
ylabel('Pojačanje zatvorenog kruga upravljanja');
hold on;

%% b) zadatak

omega_u = 20;
Um = linspace(2,4,5)    % za Um = 3 se javljaju prinudne oscilacije

for i = 1:length(Um)
    lab4(Gp, xa, omega_u, Um(i))
end

%% b) zadatak - Dither

omega_u = 20;
Um = 3;

y_stac = [];

for i = 1:20

    step_value = i;
    simulation = sim('model.mdl');
    y_stac = [simulation.y(end) y_stac];

end

figure(2);
hold on;
grid();
plot((1:20), wrev(y_stac)./(1:20), 'rx')
title('Ovisnost statičkog pojačanja o iznosu ulaznog signala - Dither signal');
xlabel('Iznos ulaznog signala');
ylabel('Pojačanje zatvorenog kruga upravljanja');
hold on;

%% c) zadatak

omega_u = 1;
Um = 10;
y_stac = [];

for i = 1:20

    step_value = i;
    simulation = sim('model.mdl');
    y_stac = [simulation.y(end) y_stac];

end

figure(3);
plot((1:20), wrev(y_stac)./(1:20), 'rx')
hold on;
grid();
ylim([-6 2]);
xlabel('Iznos ulaznog signala');
ylabel('Pojačanje zatvorenog kruga upravljanja');
hold on;

omega_u = 20;
Um = 3;
y_stac = [];

for i = 1:20

    step_value = i;
    simulation = sim('model.mdl');
    y_stac = [simulation.y(end) y_stac];

end

plot((1:20), wrev(y_stac)./(1:20), 'bx')
legend('Bez Dither signala', 'S Dither signalom');
hold on;

