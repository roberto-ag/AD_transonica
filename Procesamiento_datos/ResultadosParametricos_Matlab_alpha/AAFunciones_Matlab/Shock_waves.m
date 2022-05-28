%---------------------------------------------------------------------------------%
% Graficador de archivos .txt: Posicion de la onda de choque para distintos Mach
% Autor: Roberto Allely García
% Fecha: 25/05/2022 13:43
% Archivos usados: Surface_flow files
%---------------------------------------------------------------------------------%

leyenda = {'Extrad\''os','Intrad\''os'};

figure

X_sw_upper = zeros(length(alpha),1);
X_sw_lower = zeros(length(alpha),1);

switch perfil
    case 1
        slope_lim = 78; % grados (º)
    case 2
        slope_lim = 78; % grados (º)
end

for i=1:length(alpha)
    
    Solution = Surface_data{i};
    
    % Extrados
    X_upper = flip(Solution.Points_0(1:Mitad_ptos));
    Y_upper = flip(Solution.Pressure_Coefficient(1:Mitad_ptos));

    X_inf_index = find(X_upper >= 0.002,1);
    X_sup_index = find(X_upper >= 0.8,1);
    X_upper = X_upper(X_inf_index:X_sup_index);
    Y_upper = Y_upper(X_inf_index:X_sup_index);

    derivate = atan(diff(Y_upper)./diff(X_upper))*180/pi;

    Sw_upper_index = find(derivate >= slope_lim,1);
    
    if(isempty(Sw_upper_index))

          X_sw_upper(i) = NaN;
    else
        
        X_sw_upper(i) = X_upper(Sw_upper_index);
    end
    
    % Intrados
    X_lower = Solution.Points_0(Mitad_ptos:Lim_ptos);
    Y_lower = Solution.Pressure_Coefficient(Mitad_ptos:Lim_ptos);

    X_inf_index = find(X_lower >= 0.05,1);
    X_sup_index = find(X_lower >= 0.8,1);
    X_lower = X_lower(X_inf_index:X_sup_index);
    Y_lower = Y_lower(X_inf_index:X_sup_index);

    derivate = atan(diff(Y_lower)./diff(X_lower))*180/pi;

    Sw_lower_index = find(derivate >= slope_lim,1);
    
    if(isempty(Sw_lower_index))
        
        X_sw_lower(i) = NaN;
    else
        
        X_sw_lower(i) = X_lower(Sw_lower_index);
    end
end

hold on
p = [plot(alpha,X_sw_upper,'-sb','MarkerFaceColor','blue','MarkerSize',3),...
     plot(alpha,X_sw_lower,'--or','MarkerFaceColor','red','MarkerSize',3)];
hold off

legend(p(:),leyenda,'Location','northeast','interpreter','latex')
title(strcat('Posici\''on onda de choque',perfil_name),'interpreter','latex')
xlabel('$\alpha$ ($^\circ$)','interpreter','latex')
ylabel('$x/c$','interpreter','latex')
xlim([-2 20])
ylim([0 1.0])
set(gca,'XMinorTick','on')
set(gca,'YMinorTick','on')
grid on




