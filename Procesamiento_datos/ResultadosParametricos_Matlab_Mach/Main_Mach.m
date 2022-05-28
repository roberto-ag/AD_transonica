%---------------------------------------------------------------------------------%
% Archivo raíz para la representacion de diferentes aspectos de los resultados de las simulaciones para distintos números de Mach
% Autor: Roberto Allely García
% Fecha: 25/05/2022 0:44
%---------------------------------------------------------------------------------%

clc

addpath(genpath(pwd));

mensaje = 'Estudio de la influencia del Mach';
opciones = ["Lectura de archivos Surface_flow" "Curvas Cp (todas) (LN)" "Posicion de la onda de choque (LN)" ...
            "Mach crítico" "Coeficientes aerodinámicos" "Borrar gráficas" "Salir"];

while(1)

    opcion = menu(mensaje,opciones);

    if opcion == length(opciones)
        close all
        break;
    end
    
    switch opcion
        case 1              % Lector de archivos surface_flow .txt
            perfil = menu('Perfil usado:',["NACA 0012" "RAE 2822"]);
            Surface_file_reader;
            
        case 2              % Cp completo
            Cp_full;
            Cp_upper;
            Cp_lower;
            
        case 3              % Posicion de la onda de choque
            Shock_waves;
            
        case 4              % Mach crítico sobre el perfil
            Mach_critic;    
                  
        case 5              % Coeficientes aerodinámicos
            AeroCoeff_file_reader;
            Aero_coeff;
            
        case 6              % Borrar graficas
            close all  
    end
end

