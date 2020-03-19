% FEM ASSIGNMENT 01
%
%
%
clear; clc; close 'all';

source_file = 'data-2x12-CPS4.csv';


sim_data = csvread(source_file);

x = sim_data(:,1);
x = x - min(x);

y_fem = sim_data(:,2);

L = 300e-3;%[m]
w = 5e-3;%[m]
d = 10e-3;%[m]

J = (w*(d^3))/12;
F = -50;  %[N]
E = 90e9; %[Pa]

u =  @(x) ((F.*(x.^2))./(6*E*J)).*(3*L - x);
y_exact = u(x);

% Global Plot Adjustments
line_width=2;
color_exact= 'black';
color_1 = '[0.831372549 0.039215686 0.192156863]';
color_2 = '[0 0.490196078 0.91372549]';
color_3 = '[0.262745098 0.470588235 0]';
line_style = '-o';
%


figure;
plot(x,y_exact,line_style, 'LineWidth', 3, 'Color', color_exact);
hold on;
plot(x,y_fem, line_style, 'LineWidth', line_width, 'Color', color_1);
%
legend( ...
    'Exact', ...
    '2x12-CSP4' ...
);
%
title('Deflection (FEM vs. Analytical Solution)')
xlabel('Distance {\it x} [m]');
ylabel('Deflection {\it u} [m]');
%
grid on;


figure;
plot(x,abs(y_exact-y_fem),line_style, 'LineWidth', line_width, 'Color', color_1);
%
legend( ...
    '2x12-CSP4' ...
);
%
title('Error (FEM vs. Analytical Solution)')
xlabel('Distance {\it x} [m]');
ylabel('Error {\it e} [m]');
%
grid on;
