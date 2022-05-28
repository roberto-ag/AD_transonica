%---------------------------------------------------------------------------------%
% Graficador de los coeficientes aerodinámicos en función del AoA
% Autor: Roberto Allely García
% Fecha: 26/05/2022 12:46
% Archivos usados: Aero_coeff files
%---------------------------------------------------------------------------------%

leyenda = {'NACA 0012','RAE 2822'};
linea = {{'--r','MarkerFaceColor','red'},{'-b','MarkerFaceColor','blue'}};

% Subfigura del Cl
figure(1)

p = zeros(1,n_AeroCoeff_files);

hold on
for i=1:n_AeroCoeff_files
    
    alpha = AeroCoeff_data{i}.alpha;
    Cl = AeroCoeff_data{i}.C_l;
    
    p(i) = plot(alpha,Cl,linea{i}{:});
end

hold off
legend(p(1:n_AeroCoeff_files),leyenda,'Location','southeast','interpreter','latex');
title('Coeficiente de sustentaci\''on','interpreter','latex')
xlabel('$\alpha$ ($^\circ$)','interpreter','latex')
ylabel('$C_l$','interpreter','latex')
% xlim(Limites_eje_x)
% ylim(Limites_eje_y)
% xticks(Delimitadores_eje_x)
% yticks(Delimitadores_eje_y)
set(gca,'XMinorTick','on')
set(gca,'YMinorTick','on')
grid on


% Subfigura del Cd
figure(2)

hold on
for i=1:n_AeroCoeff_files
    
    alpha = AeroCoeff_data{i}.alpha;
    Cd = AeroCoeff_data{i}.C_d;
    
    p(i) = plot(alpha,Cd,linea{i}{:});
end

hold off
legend(p(1:n_AeroCoeff_files),leyenda,'Location','southeast','interpreter','latex');
title('Coeficiente de resistencia','interpreter','latex')
xlabel('$\alpha$ ($^\circ$)','interpreter','latex')
ylabel('$C_d$','interpreter','latex')
% xlim(Limites_eje_x)
% ylim(Limites_eje_y)
% xticks(Delimitadores_eje_x)
% yticks(Delimitadores_eje_y)
set(gca,'XMinorTick','on')
set(gca,'YMinorTick','on')
grid on


% Subfigura del CEff
figure(3)

hold on
for i=1:n_AeroCoeff_files
    
    alpha = AeroCoeff_data{i}.alpha;
    CEff = AeroCoeff_data{i}.C_Eff;
    
    p(i) = plot(alpha,CEff,linea{i}{:});
end

hold off
legend(p(1:n_AeroCoeff_files),leyenda,'Location','northeast','interpreter','latex');
title('Eficiencia aerodin\''amica','interpreter','latex')
xlabel('$\alpha$ ($^\circ$)','interpreter','latex')
ylabel('$\eta_{aero}$','interpreter','latex')
% xlim(Limites_eje_x)
% ylim(Limites_eje_y)
% xticks(Delimitadores_eje_x)
% yticks(Delimitadores_eje_y)
set(gca,'XMinorTick','on')
set(gca,'YMinorTick','on')
grid on


% Subfigura del Cmz
figure(4)

hold on
for i=1:n_AeroCoeff_files
    
    alpha = AeroCoeff_data{i}.alpha;
    C_mz = AeroCoeff_data{i}.C_mz;
    
    % Corrección de la distancia de referencia (0.64607 --> 1)
    if(i == 1)
        correccion = 0.64607;
    else
        correccion = 1;
    end
    
    p(i) = plot(alpha,-C_mz*correccion,linea{i}{:});
end

hold off
legend(p(1:n_AeroCoeff_files),leyenda,'Location','northeast','interpreter','latex');
title('Coeficiente de momento','interpreter','latex')
xlabel('$\alpha$ ($^\circ$)','interpreter','latex')
ylabel('$C_m$','interpreter','latex')
% xlim(Limites_eje_x)
% ylim(Limites_eje_y)
% xticks(Delimitadores_eje_x)
% yticks(Delimitadores_eje_y)
set(gca,'XMinorTick','on')
set(gca,'YMinorTick','on')
grid on


% Subfigura de la polar Cl-Cd
figure(5)

hold on
for i=1:n_AeroCoeff_files
    
    Cd = AeroCoeff_data{i}.C_d;
    Cl = AeroCoeff_data{i}.C_l;
    
    p(i) = plot(Cd,Cl,linea{i}{:});
end

hold off
legend(p(1:n_AeroCoeff_files),leyenda,'Location','southeast','interpreter','latex');
title('Gr\''afica polar','interpreter','latex')
xlabel('$C_d$','interpreter','latex')
ylabel('$C_l$','interpreter','latex')
% xlim(Limites_eje_x)
% ylim(Limites_eje_y)
% xticks(Delimitadores_eje_x)
% yticks(Delimitadores_eje_y)
set(gca,'XMinorTick','on')
set(gca,'YMinorTick','on')
grid on



