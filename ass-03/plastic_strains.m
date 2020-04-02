% Calculate Plastic Strains
% for Material "Steel-1"
% Abaqus modell "assignment_3.cae"
%
clear; clc; close 'all';

out_file='plastic-strains.csv';
s_bar = (220:10:680)*1E6; % [Pa]

s0 = 220E6;     % [Pa]
E =70E9;          % [Pa]
B = 3E9;           % [Pa]
n = 3.2;            % [1]

e = (s0/E) ...
    + (s0/B).*(((s_bar./(s0))-1).^n);

% Write Data
out_vec = [s_bar' e'];
csvwrite(out_file,out_vec)