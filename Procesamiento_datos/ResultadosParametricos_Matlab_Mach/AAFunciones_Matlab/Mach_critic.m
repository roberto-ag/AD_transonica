%---------------------------------------------------------------------------------%
% Graficador de archivos .txt: Grafica del Mach critico frente al Mach aguas arriba
% Autor: Roberto Allely García
% Fecha: 26/05/2022 0:51
% Archivos usados: Flow files
%---------------------------------------------------------------------------------%

leyenda = {'NACA 0012','RAE 2822'};
forma = {'--r','b'};

figure

p = zeros(1,2);

hold on
for j=1:2
    
    perfil = j;
    Flow_file_reader;
    
    Mach_dot = zeros(n_Flow_files,1);
    
    for i=1:n_Flow_files

        Solucion = Flow_data{i}.Mach;
        Mach_dot(i) = max(Solucion);
    end
    
    p(j) = plot(Mach,Mach_dot,forma{j});
end


Xlim = get(gca,'XLim');
line(Xlim,[1 1],'Color','red','LineStyle',':');
text(Xlim(2)-0.1,1.02,'$M^*=1$','interpreter','latex');

hold off

legend(p(:),leyenda,'Location','northwest','interpreter','latex')
title('Mach m\''aximo','interpreter','latex')
xlabel('$M_\infty$','interpreter','latex')
ylabel('$M^*$','interpreter','latex')
% xlim([0.6 1.0])
% ylim([0.1 1.0])
set(gca,'XMinorTick','on')
set(gca,'YMinorTick','on')
grid on