%% Prvi zadatak : Eksperimentalno određivanje opisne funkcije
clear all;
close all;
s = tf('s');

%% Parametri
D = 0.1;

Xm_pom = [0.04 0.06 0.08 0.1 0.12 0.14 0.16 0.18 0.2 0.22 0.24 0.26];
T_sim = 100;
Ts = 0.01;
%frekvencija
w = 1;
n = 2;
XD = Xm_pom/D;
N = T_sim/Ts;

%% a) zadatak

for i = 1:4  % i = 4 najbolje
    n = i; %red filtra
    %Gf - filtriranje izlaznog signala
    Gf = (sqrt(2)*w)^n/(s+w)^n;
    % Brojnik i nazivnik filtra koji se šalju u Simulink
    [Gfnum, Gfden] = tfdata(Gf);
    Gfnum = cell2mat(Gfnum);
    Gfden = cell2mat(Gfden);
    rezultati = cell(length(Xm_pom),1);
        
    for j = 1:length(Xm_pom)
        Xm = Xm_pom(j);
        sim('Zadatak1');
        % ulazni signal
        x = u.Data(end-N/2:end);
        % izlazni signal
        u = y.Data(end-N/2:end);
        % Određivanje faze preko formule
        faza = acos((dot(x,u))/sqrt(dot(x,x)*dot(u,u)));
        fi = unwrap(faza - n*atan(w/w));
        Um = max(u);
        Pn = Um/Xm*cos(fi);
        Qn = Um/Xm*sin(fi);
        
        rezultati{j} = [Xm, Um, Pn, Qn, fi, faza];
    end
    disp(i)
    rezultati = cell2mat(rezultati)

    plot_results(XD,rezultati,i)
    hold off;
end

%% b) zadatak

function [] = plot_results(XD,rezultati,i)
    ezplot(@gn,[0, 3.5])
    hold on
    grid on;
    
    plot(XD, rezultati(:, 3) , 'x', 'MarkerSize', 8);
    title('Analitički i eksperimentalni rezultati opisne funkcije')
    xlabel('X_{m}/D');
    ylabel('G_{N} (X_{m}/D)');
    legend(strcat('Analitički određena opisna funkcija za n=',num2str(i)) , 'Eksperimentalni uzorci opisne funkcije');
    
    function [y] = gn(XD)
        if(XD < 0.5)
            y = 0;
        elseif(XD >= 0.5 && XD < 1.5)
            y = 4/XD/pi*sqrt(1-(1/2)^2*(1/XD)^2);
        elseif(XD >= 1.5 && XD < 2.5)
            y = 4/XD/pi*(sqrt(1-(1/2)^2*(1/XD)^2)+sqrt(1-(3/2)^2*(1/XD)^2));
        elseif(XD >= 2.5 && XD < 3.5)
            y = 4/XD/pi*(sqrt(1-(1/2)^2*(1/XD)^2)+sqrt(1-(3/2)^2*(1/XD)^2)+sqrt(1-(5/2)^2*(1/XD)^2));
        else
            y = 0;
        end
    end
    hold off;
end