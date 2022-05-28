%---------------------------------------------------------------------------------%
% Lector de archivos .txt del surface_flow
% Autor: Roberto Allely García
% Fecha: 26/05/2022 12:39
% Archivos usados: Surface_flow
%---------------------------------------------------------------------------------%

%---------------------------------------------------------------------------------%
% Data de los surface_flow.vtu
% Anotaciones:
%       Campo 1: .Points_0
%       Campo 2: .Points_1
%       Campo 3: .Points_2
%       Campo 4: .Pressure_Coefficient
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


% Ordenación de la estructura

Del = {'alpha_','.txt','Data_'};        % Cadenas de texto a eliminar

for i=1:n_Surface_files
    
    name_Surface_files(i) = replace(name_Surface_files(i),Del,'');
    Surface_files(i).order = str2double(name_Surface_files(i));
end

Surface_files_table = struct2table(Surface_files);
Surface_files_table = sortrows(Surface_files_table,'order');
Surface_files = table2struct(Surface_files_table);


% Recogida de datos

Surface_data = cell(1,n_Surface_files);

for i=1:n_Surface_files
    
    File = fullfile(directory_path,Surface_files(i).name);
    Surface_data{i} = readtable(File);
end


% Lector alpha

alpha = zeros(n_Surface_files,1);
Del = {'alpha_','.txt','Data_'};        % Cadenas de texto a eliminar

name_Surface_files = {Surface_files.name};
name_Surface_files = convertCharsToStrings(name_Surface_files)';

for i=1:n_Surface_files
    
    name_Surface_files(i) = replace(name_Surface_files(i),Del,'');
    alpha(i,1) = str2double(name_Surface_files(i));
end


% Selector de perfiles

switch perfil
    case 1      %Parametros NACA 0012
        Mitad_ptos = 751;
        Lim_ptos = 1500;
        perfil_name = ' NACA 0012';
        
    case 2      % Parametros RAE 2822
        Mitad_ptos = 399;
        Lim_ptos = 799;
        perfil_name = ' RAE 2822';
end







