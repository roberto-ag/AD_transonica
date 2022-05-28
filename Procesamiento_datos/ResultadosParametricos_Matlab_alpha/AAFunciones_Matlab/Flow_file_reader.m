%---------------------------------------------------------------------------------%
% Lector de archivos .txt del flow
% Autor: Roberto Allely García
% Fecha: 26/05/2022 12:42
% Archivos usados: Flow
%---------------------------------------------------------------------------------%

%---------------------------------------------------------------------------------%
% Data de los flow.vtu
% Anotaciones:
%       Campo 1: .Eddy_Viscosity
%       Campo 2: .Mach
%       Campo 3: .Nu_Tilde
%       Campo 4: .Points_0
%       Campo 5: .Points_1
%       Campo 6: .Points_2
%       Campo 7: .Pressure_Coefficient
%       Para abrir ventana de selección: uigetdir(pwd, 'Select a folder for flow files');
%---------------------------------------------------------------------------------%

switch perfil
    case 1
        directory_path = strcat(pwd,'\Flow_N0012');
    case 2
        directory_path = strcat(pwd,'\Flow_RAE2822');
end

Flow_files = dir(fullfile(directory_path,'*.txt'));
n_Flow_files = length(Flow_files);

name_Flow_files = {Flow_files.name};
name_Flow_files = convertCharsToStrings(name_Flow_files)';

% Ordenación de la estructura

Del = {'alpha_','.txt','Data_'};        % Cadenas de texto a eliminar

for i=1:n_Flow_files
    
    name_Flow_files(i) = replace(name_Flow_files(i),Del,'');
    Flow_files(i).order = str2double(name_Flow_files(i));
end

Flow_files_table = struct2table(Flow_files);
Flow_files_table = sortrows(Flow_files_table,'order');
Flow_files = table2struct(Flow_files_table);


% Recogida de datos

Flow_data = cell(1,n_Flow_files);

for i=1:n_Flow_files
    
    File = fullfile(directory_path,Flow_files(i).name);
    Flow_data{i} = readtable(File);
end


% Lector alpha

alpha = zeros(n_Flow_files,1);
Del = {'alpha_','.txt','Data_'};        % Cadenas de texto a eliminar

name_Flow_files = {Flow_files.name};
name_Flow_files = convertCharsToStrings(name_Flow_files)';

for i=1:n_Flow_files
    
    name_Flow_files(i) = replace(name_Flow_files(i),Del,'');
    alpha(i,1) = str2double(name_Flow_files(i));
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