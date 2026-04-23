clc;
clear;
close all;

figure
hold on
axis equal
axis off

%% Unit circle
th = linspace(0, 2*pi, 1000);
plot(cos(th), sin(th), 'k')

%% Real axis
plot([-1 1], [0 0], 'k')

%% Constant resistance circles (r = const)
r_values = [0.1 0.2 0.5 1 2 5 10 20];
x = linspace(-50, 50, 4000);

for r = r_values
    z = r + 1j*x;
    gamma = (z - 1) ./ (z + 1);
    plot(real(gamma), imag(gamma), 'k')
end

%% Constant reactance circles (x = const)
x_values = [0.1 0.2 0.5 1 2 5 10 20];
r = linspace(0, 50, 4000);

for x = x_values
    % Positive reactance
    z = r + 1j*x;
    gamma = (z - 1) ./ (z + 1);
    plot(real(gamma), imag(gamma), 'k')
    
    % Negative reactance
    z = r - 1j*x;
    gamma = (z - 1) ./ (z + 1);
    plot(real(gamma), imag(gamma), 'k')
end

title('Smith Chart')
