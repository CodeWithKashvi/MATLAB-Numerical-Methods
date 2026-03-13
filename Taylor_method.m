clc
clear

x = input('Enter initial value of x: ');
y = input('Enter initial value of y: ');
h = input('Enter step size h: ');
xn = input('Enter final value of x: ');

n = round((xn - x)/h);

disp('Step        x            y (Taylor)')
disp('-------------------------------------------')

fprintf('%d     %8.4f     %12.6f\n',0,x,y)

for i = 1:n
    
    % First derivative
    y1 = x^2 + y^2;
    
    % Second derivative
    y2 = 2*x + 2*y*y1;
    
    % Third derivative
    y3 = 2 + 2*(y1^2 + y*y2);

    % Taylor formula (3rd order)
    y = y + h*y1 + (h^2/2)*y2 + (h^3/6)*y3;
    x = x + h;

    fprintf('%d     %8.4f     %12.6f\n',i,x,y)
end