%---------------------------------------------------------------------------------%
% Graficador de archivos .txt: Curvas Cp completas de todo el perfil para NACA 0012 y RAE 2822
% Autor: Roberto Allely García
% Fecha: 26/05/2022 20:39
% Archivos usados: Surface_flow files
%---------------------------------------------------------------------------------%

Surface_file_reader;

leyenda = {'NACA 0012','RAE 2822'};
linea = {{'--r','MarkerFaceColor','red'},{'-b','MarkerFaceColor','blue'}};

figure

p = zeros(1,2);

hold on
for i=1:n_Surface_files
    
    Solution = Surface_data{i};
    
    X_upper = Solution.Points_0;
    Y_upper = Solution.Pressure_Coefficient;
    
    p(i) = plot(X_upper,Y_upper,linea{i}{:});
end

hold off

legend(p(1:n_Surface_files),leyenda,'Location','southeast','interpreter','latex');
title('Curvas $C_p$','interpreter','latex')
xlabel('$x/c$','interpreter','latex')
ylabel('$C_p$','interpreter','latex')
set(gca,'Ydir','reverse');
grid on