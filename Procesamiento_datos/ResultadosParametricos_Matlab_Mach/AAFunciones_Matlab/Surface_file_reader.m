%---------------------------------------------------------------------------------%
% Lector de archivos .txt del surface_flow
% Autor: Roberto Allely García
% Fecha: 25/05/2022 13:55
% Archivos usados: Surface_flow
%---------------------------------------------------------------------------------%

%---------------------------------------------------------------------------------%
% Data de los surface_flow.vtu
% Anotaciones:
%       Columna 13: Points_x
%       Columna 18: Cp
%       Para abrir ventana de selección: uigetdir(pwd, 'Select a folder for flow files');
%---------------------------------------------------------------------------------%

switch perfil
    case 1
        directory_path = strcat(pwd,'\Surface_flow_N0012');
    case 2
        directory_path = strcat(pwd,'\Surface_flow_RAE2822');
end

Surface_files = dir(fullfile(directory_path,'*.txt'));
n_Surface_files = length(Surface_files);

name_Surface_files = {Surface_files.name};
name_Surface_files = convertCharsToStrings(name_Surface_files)';

Surface_data = cell(1,n_Surface_files);


for i=1:n_Surface_files
    
    File = fullfile(directory_path,Surface_files(i).name);
    Surface_data{i} = readtable(File);
end


% Lector Mach

Mach = zeros(n_Surface_files,1);
Del = {'M_','.txt','Data_'};        % Cadenas de texto a eliminar


for i=1:n_Surface_files
    
    name_Surface_files(i) = replace(name_Surface_files(i),Del,'');
    Mach(i,1) = str2double(name_Surface_files(i));
end


% Selector de perfiles

switch perfil
    case 1      %Parametros NACA 0012
        Mitad_ptos = 749;
        Lim_ptos = 1500;
        perfil_name = ' NACA 0012';
        
    case 2      % Parametros RAE 2822
        Mitad_ptos = 399;
        Lim_ptos = 799;
        perfil_name = ' RAE 2822';
end







