clc
clear
close all


airfoil_DB = load('NACA0012_201_raw.txt');
x_raw = airfoil_DB(:,1);
y_raw = airfoil_DB(:,2);
z_raw = airfoil_DB(:,3);

pt = round(interparc(3001,x_raw,y_raw,z_raw,'spline'),12);

% Plot the result
plot(x_raw,y_raw,'r*',pt(:,1),pt(:,2),'b-o')
axis([-0.5 1.5 -1.0 1.0])
axis equal
grid on
xlabel X
ylabel Y
title 'Airfoil smoothered'

n = length(pt(:,1));

%writematrix(pt,'NACA0012_3001_splined.dat','Delimiter',' ');

