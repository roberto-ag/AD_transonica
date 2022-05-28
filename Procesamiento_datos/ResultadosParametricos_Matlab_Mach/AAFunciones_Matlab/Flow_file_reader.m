%---------------------------------------------------------------------------------%
% Lector de archivos .txt del flow
% Autor: Roberto Allely García
% Fecha: 26/05/2022 0:14
% Archivos usados: Flow
%---------------------------------------------------------------------------------%

%---------------------------------------------------------------------------------%
% Data de los flow.vtu
% Anotaciones:
%       Columna 3: Mach
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

Flow_data = cell(1,n_Flow_files);


for i=1:n_Flow_files
    
    File = fullfile(directory_path,Flow_files(i).name);
    Flow_data{i} = readtable(File);
end


% Lector Mach

Mach = zeros(n_Flow_files,1);
Del = {'M_','.txt','Data_'};        % Cadenas de texto a eliminar


for i=1:n_Flow_files
    
    name_Flow_files(i) = replace(name_Flow_files(i),Del,'');
    Mach(i,1) = str2double(name_Flow_files(i));
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