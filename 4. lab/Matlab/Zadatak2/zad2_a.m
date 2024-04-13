Ks = 1.61;
Jh = 0.0021;
m = 0.4;
g = - 9.81;
h = 0.06;
Km = 0.00767;
Jl = 0.0059;
Rm = 2.6;
Kg = 70;

syms x1;
syms x2;
syms x3;
syms x4;

h = x1 + x2;
g1 = 0;
g2 = 0;
g3 = Kg*Km/(Jh*Rm);
g4 = -Kg*Km/(Jh*Rm);

f1 = x3;
f2 = x4;
f3 = Ks/Jh * x2 - ((Km^2*Kg^2)/(Rm*Jh))*x3;
f4 = -(Ks/Jh + Ks/Jl)*x2 + m*g*h/Jl * sin(x1+x2) + (Km^2*Kg^2/(Rm*Jh)) *x3;
F = [f1; f2; f3; f4]
G = [g1; g2; g3; g4]
%r=1
diff(f4,x1)
[diff(h, x1) diff(h, x2) diff(h,x3) diff(h, x4)] * G
%=0


%r=2
h = [diff(h, x1) diff(h, x2) diff(h,x3) diff(h, x4)] * F
[diff(h, x1) diff(h, x2) diff(h,x3) diff(h, x4)] * G

%=0
h = [diff(h, x1) diff(h, x2) diff(h,x3) diff(h, x4)] * F
[diff(h, x1) diff(h, x2) diff(h,x3) diff(h, x4)] * G
%=0

%r=3
h = [diff(h, x1) diff(h, x2) diff(h,x3) diff(h, x4)] * F
Lgf3h = [diff(h, x1) diff(h, x2) diff(h,x3) diff(h, x4)] * G
%ans = 1062128232431616355/3958241859993 != 0

Lf4h = [diff(h, x1) diff(h, x2) diff(h,x3) diff(h, x4)] * F
% = [diff(h, x1) diff(h, x2) diff(h,x3) diff(h, x4)] * F

syms u
v = Lf4h + Lgf3h * u
vpa(v,6)