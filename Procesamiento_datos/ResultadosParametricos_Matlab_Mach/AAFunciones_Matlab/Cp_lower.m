%---------------------------------------------------------------------------------%
% Graficador de archivos .txt: Curvas Cp del intradós para distintos Mach
% Autor: Roberto Allely García
% Fecha: 25/05/2022 13:44
% Archivos usados: Surface_flow files
%---------------------------------------------------------------------------------%

figure

hold on
for i=1:n_Surface_files     % Cambiar el rango del for para representar únicamente las curvas de Cp de los Mach deseados
    
    Solution = Surface_data{i};
    
    X_lower = Solution.Points_0(Mitad_ptos:Lim_ptos);
    Y_lower = Solution.Pressure_Coefficient(Mitad_ptos:Lim_ptos);
    
    plot(X_lower,Y_lower);
end

hold off

title(strcat('Curvas $C_p$ del intrad\''os del',perfil_name),'interpreter','latex')
xlabel('$x/c$','interpreter','latex')
ylabel('$-C_p$','interpreter','latex')
set(gca,'Ydir','reverse');
grid on