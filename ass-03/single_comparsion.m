% 
%
clear; clc; close 'all';

job='1';

% small sliding correction
correction = 0; % 1 = on, 0= off

w = 100E-3; % [m]
b = 14E-3; % [m]
h = 4E-3; % [m]

% Symmetry
b = b/2;
h = h/2;

u_filename     = ['Job' job '-U2.csv'];
rf_filename    = ['Job' job '-RF2.csv'];
l_filename      = ['Job' job '-U1.csv'];

u_data = csvread(u_filename); % alternatively xlsread()
rf_data = csvread(rf_filename); % alternatively xlsread()
l_data = csvread(l_filename); % alternatively xlsread()

hx = -u_data(:,2);
P = rf_data(:,2);
l = 0*l_data(:,2);%

e2 = log(h./(h-hx));
e1 = -e2;
e3 = 0;

s1 = 0;
s2 = P./(w.*(b+l));
s3 = s2/2;

e_vm = 2/sqrt(3)*e2;
s_vm = sqrt(3)/2*s2;

if correction == 1
    l = l_data(:,2);%

    e2 = log(h./(h-hx));
    e1 = -e2;
    e3 = 0;

    s1 = 0;
    s2 = P./(w.*(b+l));
    s3 = s2/2;

    e_vm_c = 2/sqrt(3)*e2;
    s_vm_c = sqrt(3)/2*s2;
end

%% EXACT SOLUTION
s_bar = (220:10:720)*1E6; % [Pa]

s0 = 220E6;     % [Pa]
E =70E9;          % [Pa]
B = 3E9;           % [Pa]
n = 3.2;            % [1]

e = (s0/E) ...
    + (s0/B).*(((s_bar./(s0))-1).^n);

%% DISPLAY DATA

% Global Plot Adjustments
line_width=2;
color_exact= 'black';
color_1 = '[0.831372549 0.039215686 0.192156863]';
color_2 = '[0 0.490196078 0.91372549]';
color_3 = '[0.262745098 0.470588235 0]';
line_style = '-';

figure;
plot(e,s_bar, line_style, 'LineWidth', line_width, 'Color', color_exact,'DisplayName','Analytical');
hold on;
plot(e_vm(1:end),-s_vm(1:end), line_style, 'LineWidth', line_width, 'Color', color_1,'DisplayName', 'Simulation');
if correction == 1
    hold on;
    plot(e_vm_c(1:end),-s_vm_c(1:end), '--', 'LineWidth', line_width, 'Color', color_1,'DisplayName', 'Compensated');
end
%
title('Strain-Stress Relation')
xlabel('v.Mises Strain  {\it \epsilon} [1]');
ylabel('v.Mises Stress {\it \sigma} [1]');
%
grid on;
legend('Location','southeast');
legend show;
