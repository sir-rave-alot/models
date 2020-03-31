% FEM ASSIGNMENT 01
%
%
%
clear; clc; close 'all';

source_file = '03-SM-AB-S-1mm-CPS8.csv';
%01-SM-AB-S-0mm-CPS8.csv
%02-GM-AB-S-0mm-CPS8.csv
%03-SM-AB-S-1mm-CPS8.csv
%04-SM-AB-S-1mm-CPS8-f.csv
% 05-SM-AB-S-5mm-CPS8-f.csv

sim_data = csvread(source_file);

r = sim_data(:,1);
r = r - min(r);

s = sim_data(:,2);


% Global Plot Adjustments
line_width=2;
color_exact= 'black';
color_1 = '[0.831372549 0.039215686 0.192156863]';
color_2 = '[0 0.490196078 0.91372549]';
color_3 = '[0.262745098 0.470588235 0]';
line_style = '-o';
%



figure;
plot(r,s, line_style, 'LineWidth', line_width, 'Color', color_1);
%
title('Stress along AB')
xlabel('Distance from outer conrner{\it r} [m]');
ylabel('Mises Stress {\it S} [Pa]');
%
grid on;

%figure;
%plot(x,y_exact,line_style, 'LineWidth', 3, 'Color', color_exact);
%hold on;
%plot(x,y_fem, line_style, 'LineWidth', line_width, 'Color', color_1);
%
%legend( ...
    %'Exact', ...
    %'2x12-CSP4' ...
%);
%
%title('Deflection (FEM vs. Analytical Solution)')
%xlabel('Distance {\it x} [m]');
%ylabel('Deflection {\it u} [m]');
%
%grid on;
