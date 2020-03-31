% FEM ASSIGNMENT 01
%
%
%
clear; clc; close 'all';

%% READ DATA FROM DISK
source_des_g = '4x24-CPS';
source_des_s = {'4' '4R' '8' '8R'};

source_prot_name = 'data-';

n = max(size(source_des_s));
source_suffix = '.csv';


x = [];
y_fem = [];


for i = 1:n
    curr_file = [source_prot_name source_des_g source_des_s{i} source_suffix];
    curr_data = csvread(curr_file);
    curr_x = curr_data(:,1);
    curr_x = curr_x - min(curr_x);
    curr_y = curr_data(:,2);
    x = [x curr_x];
    y_fem = [y_fem curr_y];
end

%% EXACT SOLUTION

L = 300e-3;%[m]
w = 5e-3;%[m]
d = 10e-3;%[m]

J = (w*(d^3))/12;
F = -50;  %[N]
E = 90e9; %[Pa]

u =  @(x) ((F.*(x.^2))./(6*E*J)).*(3*L - x);

x_exact = x(:,1);
y_exact = u(x_exact);


%% Global Plot Adjustments
line_width=2;
plt_colors = {...
     ' [0.5 0.5 0.5]' ...
     '[0.831372549 0.039215686 0.192156863]' ...
     '[0 0.490196078 0.91372549]' ...
     '[0.262745098 0.470588235 0]' ...
     '[0.341176471 0.258823529 0.250980392]' ...
    };

line_style = '-o';
%

%% PLOT DEFLECTION
figure;
plot(x_exact,y_exact,line_style, 'LineWidth', 5, 'Color', plt_colors{1}, 'DisplayName','Exact');
hold on;
for i = 1:n
    plot(x(:,i),y_fem(:,i), line_style, 'LineWidth', line_width, 'Color', plt_colors{i+1}, 'DisplayName',[source_des_g source_des_s{i}]);
    hold on;
end
hold off;
%
legend('Location','southwest');
legend show;
%
title('Deflection (FEM vs. Analytical Solution)')
xlabel('Distance {\it x} [m]');
ylabel('Deflection {\it u} [m]');
%
grid on;

%% PLOT ERROR
figure;
for i = 1:n
    semilogy(x(2:end,i),abs(y_exact(2:end)-y_fem(2:end,i)), line_style, 'LineWidth', line_width, 'Color', plt_colors{i+1}, 'DisplayName',[source_des_g source_des_s{i}]);
    hold on;
end
hold off;
%
legend('Location','southeast');
legend show;

%
%
title(' Error (FEM vs. Analytical Solution)')
xlabel('Distance {\it x} [m]');
ylabel('Error  {\it e} [m]');
%
grid on;



return
figure;
plot(x,abs(y_exact-y_fem),line_style, 'LineWidth', line_width, 'Color', color_1);
%
legend( ...
    '2x12-CSP4' ...
);
