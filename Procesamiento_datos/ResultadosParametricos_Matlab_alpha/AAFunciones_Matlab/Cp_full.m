%---------------------------------------------------------------------------------%
% Graficador de archivos .txt: Curvas Cp completas de todo el perfil para distintos AoA
% Autor: Roberto Allely García
% Fecha: 26/05/2022 12:56
% Archivos usados: Surface_flow files
%---------------------------------------------------------------------------------%

figure

hold on
for i=1:n_Surface_files     % Cambiar el rango del for para representar únicamente las curvas de Cp de los AoA deseados
    
    Solution = Surface_data{i};
    
    X_upper = Solution.Points_0;
    Y_upper = Solution.Pressure_Coefficient;
    
    plot(X_upper,Y_upper);
end

hold off

title(strcat('Curvas $C_p$ del',perfil_name),'interpreter','latex')
xlabel('$x/c$','interpreter','latex')
ylabel('$-C_p$','interpreter','latex')
set(gca,'Ydir','reverse');
grid on