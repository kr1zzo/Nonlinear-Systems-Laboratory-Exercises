function lab4(Gp, xa, omega_u, Um)

% Ulazni parametri
s = sym('s');
syms Xm
delta = 1e-1; 
pi = 3.14;

[num, den] = tfdata(Gp, 'v');
denumerator = poly2sym(den, s);
numerator = poly2sym(num, s);

% Supstitucija s = j(omega)
A_jw = subs(denumerator, s, 1i*omega_u);
B_jw = subs(numerator, s, 1i*omega_u);

% Opisna funkcija nelinearnog elementa
Gn = 1-2/pi*(asin(xa/Xm) + xa/Xm*sqrt(1-(xa/Xm)^2));

% lijeva strana jednadžbe je kompleksna funkcija s promjenjivim
% parametrom Xm (amplituda prinudnih oscilacija)
left_part = Xm*(A_jw + Gn*B_jw)/A_jw;
xm_value = 3:0.001:10;

f_Xm = subs(left_part, xm_value);
Re = real(f_Xm);
Im = imag(f_Xm);

% Desna strana jednadžbe se u kompleksnoj ravnini može prikazati kao kruºžnica
% radijusa Um sa središtem u ishodištu.
[x,y,~] = cylinder(Um, 300);

% Presjecište ove dvije krivulje, ukoliko postoji, jest točka koja je određena
% parametrima Xm (amplituda prinudnih oscilacija) i φ (fazno zaostajanje prinudnih oscilacija za pobudnim
% signalom)
temp = 0;
for i=1:length(f_Xm)
    x1=real(f_Xm(i));
    y1=imag(f_Xm(i));
    if (abs(x1^2+y1^2-Um^2)<= delta)
        fprintf('Xm_graf=%.4f\n',xm_value(i));
        fprintf('phi_graf=%.4f\n',-180/pi*(atan2(y1,x1)));
        temp = i;
    end
end

% Graf jednadžbe
figure(1);
hold on;
grid();
title(strcat('Xm*(A_jw + Gn*B_jw)/A_jw = U_m*e{-j\phi}, Um = ', num2str(Um)))
plot(x(1,:), y(1,:), 'r');
plot(Re, Im, 'b');
ylim([-11, 11]);
xlabel('Re');
ylabel('Im');

leg1=legend('U_m*e{-j\phi}', 'f (X_m) ','Location','NorthEast');set(leg1,'FontSize',9);
ah1=axes('position',get(gca,'position'),'visible','off');
%leg2=legend(ah1,strcat('xm_graph = ', num2str(xm_graph), '\nphi_graph = ', num2str(phi)),'Location','NorthWest');set(leg2,'FontSize',9);

hold off;

figure(2);
sgtitle('Realni i imaginarni dio jednažbe kao funkcija Xm')
subplot(2,1,1)
hold on;
plot(xm_value, Re, 'b');
grid();
xlabel('X_m');
ylabel('Re');

subplot(2,1,2)
plot(xm_value, Im, 'r');
grid();
xlabel('X_m');
ylabel('Imaginarni dio');
hold off;

end
