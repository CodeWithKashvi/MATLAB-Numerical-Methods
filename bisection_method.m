clc;
clear;

% Define function
F = @(x) x.^3 - x - 1;

% User input
a = input("Enter value of a: ");
b = input("Enter value of b: ");
tol = input("Enter tolerance: ");

% Bisection check
if F(a)*F(b) > 0
    disp("Not a valid interval for bisection");
else
    n = 100;   % max iterations

    for i = 1:n
        c = (a + b)/2;

        if abs(F(c)) < tol
            break;
        end

        if F(a)*F(c) < 0
            b = c;
        else
            a = c;
        end
    end

    fprintf("Root is %.4f\n", c);
end

% -------- GRAPH PART --------
x = linspace(a-1, b+1, 400);   % x range
y = F(x);

figure;
plot(x, y);        % function graph
hold on;
plot(c, 0, 'o');   % root point
yline(0);          % x-axis
grid on;

xlabel('x');
ylabel('F(x)');
title('Graph of F(x) = x^3 - x - 1 with Root');
