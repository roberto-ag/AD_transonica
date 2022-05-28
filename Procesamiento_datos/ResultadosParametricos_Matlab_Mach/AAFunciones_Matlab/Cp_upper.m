%---------------------------------------------------------------------------------%
% Graficador de archivos .txt: Curvas Cp del extradós para distintos Mach
% Autor: Roberto Allely García
% Fecha: 25/05/2022 13:44
% Archivos usados: Surface_flow files
%---------------------------------------------------------------------------------%

figure

hold on
for i=1:n_Surface_files     % Cambiar el rango del for para representar únicamente las curvas de Cp de los Mach deseados
    
    Solution = Surface_data{i};
    
    X_upper = Solution.Points_0(1:Mitad_ptos);
    Y_upper = Solution.Pressure_Coefficient(1:Mitad_ptos);
    
    plot(X_upper,Y_upper);
end

hold off

title(strcat('Curvas $C_p$ del extrad\''os del',perfil_name),'interpreter','latex')
xlabel('$x/c$','interpreter','latex')
ylabel('$-C_p$','interpreter','latex')
set(gca,'Ydir','reverse');
grid on