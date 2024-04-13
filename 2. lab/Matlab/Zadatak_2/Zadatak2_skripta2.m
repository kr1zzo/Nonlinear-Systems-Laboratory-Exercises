%%

clear all;
close all;
D = 0.1;

T_sim = 200;
K = 20;
T1 = 3;
T = 2;
y_ref = 8;
TR = T1;
n = 0.8;
KR = n*pi/2 * T1/(T*K);
plot_kvantizator(KR,y_ref,n)
hold on;
y_ref = 11;
plot_kvantizator(KR,y_ref,n)
hold off;

%%
function [] = plot_kvantizator(Kr, y_ref,n)
    
    
    whos global

    sim('Zadatak2');
    
    figure(1);
    plot(t, e1)
    
    hold on
    plot(t, u1)
    title(['K_R = n *pi/2 * T1/(T*K) [n = ',num2str(n),'] = ', num2str(Kr)]) 
    xlabel('t [s]');
    grid();
    grid on
end