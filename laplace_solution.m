clc
clear
syms t s

y0 = 1;
dy0 = 0;

Ys = (s*y0 + dy0 + y0)/(s^2 + s - 6);

y_t = ilaplace(Ys,s,t);

disp(y_t)