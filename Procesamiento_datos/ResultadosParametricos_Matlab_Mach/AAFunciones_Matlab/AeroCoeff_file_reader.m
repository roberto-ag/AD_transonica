%---------------------------------------------------------------------------------%
% Lector de valores de Mach directamente a partir del nombre de los archivos .txt
% Autor: Roberto Allely García
% Fecha: 25/05/2022 13:55
% Archivos usados: Surface_flow files
%---------------------------------------------------------------------------------%


%---------------------------------------------------------------------------------%
% Data de los coeficientes aerodinámicos de los history.csv
% Anotaciones:
%       Columna 1: Mach
%       Columna 2: Cl
%       Columna 3: Cd
%       Columna 4: CEff
%       Para abrir ventana de selección: uigetdir(pwd, 'Select a folder for flow files');
%---------------------------------------------------------------------------------%

directory_path = strcat(pwd,'\Aero_Coeff_M');
AeroCoeff_files = dir(fullfile(directory_path,'*.txt'));
n_AeroCoeff_files = sum(arrayfun(@(files) ~isempty(files.name),AeroCoeff_files));

name_AeroCoeff_files = {AeroCoeff_files.name};
name_AeroCoeff_files = convertCharsToStrings(name_AeroCoeff_files)';

AeroCoeff_data = cell(1,n_AeroCoeff_files);


for i=1:n_AeroCoeff_files
    
    File = fullfile(directory_path,AeroCoeff_files(i).name);
    AeroCoeff_data{i} = readtable(File);
end