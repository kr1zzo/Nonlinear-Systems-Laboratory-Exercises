%% Drugi zadatak : Analiza vlastitih oscilacija
close all;
clear all;

D = 0.1;

T_sim = 500;


%% b) + c) zadatak

K = 20;
T1 = 3;
T = 2;
y_ref = 8;
TR = T1;
n = 0.965;
KR = n*pi/2 * T1/(T*K);
plot_kvantizator(KR,y_ref,n)



%%
function [] = plot_kvantizator(Kr, y_ref,n)
    
    
    whos global

    sim('Zadatak2');
    
    figure(1);
    plot(t, e1)
    
    hold on
    plot(t, u1)
    title(['K_R = n *pi/2 * T1/(T*K) [n = ',num2str(n),'] = ', num2str(Kr), ', y_{ref} = ', num2str(y_ref)]) 
    xlabel('t [s]');
    grid();
    legend('Ulazni signal kvantizatora', 'Izlazni signal kvantizatora')
    grid on
end

