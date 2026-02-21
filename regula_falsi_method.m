clc;
clear;

f = @(x) x.^3 - x - 2;      % function

a = 2;
b = 3;

tol = 0.001;
maxIter = 100;

fa = f(a);
fb = f(b);

prev_c = NaN;
c = a;

for iter = 1:maxIter

    c = (a*fb - b*fa) / (fb - fa);   % Regula Falsi
    fc = f(c);

    if abs(fc) <= tol || (iter > 1 && abs(c - prev_c) <= tol)
        fprintf('Root = %f\n', c);
        break
    end

    if fa * fc < 0
        b = c;
        fb = fc;
    else
        a = c;
        fa = fc;
    end

    prev_c = c;
end

% graph
xx = linspace(a-0.5, b+0.5, 400);
figure;
plot(xx, f(xx), 'b', 'LineWidth', 1.2); hold on;
plot(c, 0, 'ro', 'MarkerSize', 8);
grid on;
xlabel('x');
ylabel('f(x)');
title('Regula Falsi Method');
hold off;
