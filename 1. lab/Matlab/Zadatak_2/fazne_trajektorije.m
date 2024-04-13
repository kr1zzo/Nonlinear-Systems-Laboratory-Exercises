%% Zadatak 2 : Izračun fazne trajektorije sustava s dvopoložajnim relejom s histerezom i
%             dinamikom drugog reda

syms x

global Z xn T a C

T = 0.1;
a = 1;
C = 5;



%% 1. korak

y0 = 3;
x0 = 1;

yN = -C;
yk = -1;

get_points(x0,y0,yN,yk)

fprintf('1. korak\n Z :')
disp(Z)
fprintf(' x_n :')
disp(xn)

%% 2. korak

y0 = -1;
x0 = real(xn(2));

yN = C;
yk = 1;

get_points(x0,y0,yN,yk)

fprintf('2. korak\n Z :')
disp(Z)
fprintf(' x_n :')
disp(xn)

%% 3. korak

y0 = 1;
x0 = real(xn(2));

yN = -C;
yk = -1;

get_points(x0,y0,yN,yk)

fprintf('3. korak\n Z :')
disp(Z)
fprintf(' x_n :')
disp(xn)

%% 4. korak

y0 = -1;
x0 = real(xn(2));

yN = C;
yk = 1;

get_points(x0,y0,yN,yk)

fprintf('4. korak\n Z :')
disp(Z)
fprintf(' x_n :')
disp(xn)

%% Izračun točaka

function get_points(x0, y0, yN, yk)
syms x
global Z 
global xn
global T C a
Z = T*(x0 + yN*log(abs(yN - x0))) + y0 ;
xn = eval(solve(yk - T*(x0 - x) + yN * T * log((yN - x) / (yN - x0)) - y0));
end
