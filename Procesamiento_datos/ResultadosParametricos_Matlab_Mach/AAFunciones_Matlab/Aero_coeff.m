%---------------------------------------------------------------------------------%
% Graficador de los coeficientes aerodinámicos en función del Mach
% Autor: Roberto Allely García
% Fecha: 25/05/2022 13:55
% Archivos usados: Aero_coeff files
%---------------------------------------------------------------------------------%

leyenda = {'NACA 0012','RAE 2822'};
linea = {{'--r','MarkerFaceColor','red'},{'-b','MarkerFaceColor','blue'}};

% Subfigura del Cl
figure(1)

p = zeros(1,n_AeroCoeff_files);

hold on
for i=1:n_AeroCoeff_files
    
    Mach = AeroCoeff_data{i}.Mach;
    Cl = AeroCoeff_data{i}.C_l;
    
    p(i) = plot(Mach,Cl,linea{i}{:});
end

hold off
legend(p(1:n_AeroCoeff_files),leyenda,'Location','northeast','interpreter','latex');
title('Coeficiente de sustentaci\''on','interpreter','latex')
xlabel('$M_\infty$','interpreter','latex')
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

leyenda = {'NACA 0012','RAE 2822','Mach de divergencia'};

hold on
for i=1:n_AeroCoeff_files
    
    Mach = AeroCoeff_data{i}.Mach;
    Cd = AeroCoeff_data{i}.C_d;
    
    p(i) = plot(Mach,Cd,linea{i}{:});
end

p(3) = scatter([0.6965,0.7522],[0.01153702,0.01121218],15,'k','filled');

hold off
legend(p(1:n_AeroCoeff_files+1),leyenda,'Location','southeast','interpreter','latex');
title('Coeficiente de resistencia','interpreter','latex')
xlabel('$M_\infty$','interpreter','latex')
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

leyenda = {'NACA 0012','RAE 2822'};

hold on
for i=1:n_AeroCoeff_files
    
    Mach = AeroCoeff_data{i}.Mach;
    CEff = AeroCoeff_data{i}.C_Eff;
    
    p(i) = plot(Mach,CEff,linea{i}{:});
end

hold off
legend(p(1:n_AeroCoeff_files),leyenda,'Location','northeast','interpreter','latex');
title('Eficiencia aerodin\''amica','interpreter','latex')
xlabel('$M_\infty$','interpreter','latex')
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
    
    Mach = AeroCoeff_data{i}.Mach;
    C_mz = AeroCoeff_data{i}.C_mz;
    
    % Corrección de la distancia de referencia (0.64607 --> 1)
    if(i == 1)
        correccion = 0.64607;
    else
        correccion = 1;
    end
    
    p(i) = plot(Mach,-C_mz*correccion,linea{i}{:});
end

hold off
legend(p(1:n_AeroCoeff_files),leyenda,'Location','northeast','interpreter','latex');
title('Coeficiente de momento','interpreter','latex')
xlabel('$M_\infty$','interpreter','latex')
ylabel('$C_m$','interpreter','latex')
% xlim(Limites_eje_x)
% ylim(Limites_eje_y)
% xticks(Delimitadores_eje_x)
% yticks(Delimitadores_eje_y)
set(gca,'XMinorTick','on')
set(gca,'YMinorTick','on')
grid on



