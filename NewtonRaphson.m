%newton raphson method
clc;
clear;
f  = @(x) x.^3 - x - 1;      
df = @(x) 3.*x.^2 - 1;       
x0 = 1.5;       
tol = 1e-6;   
max_iter = 20;
for i = 1:max_iter
    x1 = x0 - f(x0)/df(x0);
    
    if abs(x1 - x0) < tol
        fprintf('Root = %.6f\n', x1);
        fprintf('Iterations = %d\n', i);
        break;
    end
    x0 = x1;
end
x = linspace(0, 2, 400);
y = f(x);

% Plotting the graph
figure;
plot(x, y, 'LineWidth', 2);
hold on;
grid on;
xlabel('x');
ylabel('f(x)');
title('Newton-Raphson Method: Calculation and Plot');
plot(x, zeros(size(x)), 'k--');

xt = linspace(x0-0.4, x0+0.4, 100);
y0 = f(x0);
    dy0 = df(x0);
    yt = dy0*(xt - x0) + y0;
    plot(xt, yt, 'r--');

    plot(x0, y0, 'bo', 'MarkerFaceColor', 'b'); 
    plot(x1, 0, 'go', 'MarkerFaceColor', 'g');

legend('f(x)', 'x-axis', 'Tangents', 'Current point', 'Next approximation');