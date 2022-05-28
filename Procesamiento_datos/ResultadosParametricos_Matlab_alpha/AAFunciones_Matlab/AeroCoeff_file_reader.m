%---------------------------------------------------------------------------------%
% Lector de valores de alpha directamente a partir del nombre de los archivos .txt
% Autor: Roberto Allely García
% Fecha: 26/05/2022 12:42
% Archivos usados: Surface_flow files
%---------------------------------------------------------------------------------%


%---------------------------------------------------------------------------------%
% Data de los coeficientes aerodinámicos de los history.csv
% Anotaciones:
%       Campo 1: .Mach
%       Campo 2: .C_l
%       Campo 3: .C_d
%       Campo 4: .C_Eff
%       Campo 5: .C_mz
%       Para abrir ventana de selección: uigetdir(pwd, 'Select a folder for flow files');
%---------------------------------------------------------------------------------%

directory_path = strcat(pwd,'\Aero_Coeff_alpha');
AeroCoeff_files = dir(fullfile(directory_path,'*.txt'));
n_AeroCoeff_files = sum(arrayfun(@(files) ~isempty(files.name),AeroCoeff_files));

name_AeroCoeff_files = {AeroCoeff_files.name};
name_AeroCoeff_files = convertCharsToStrings(name_AeroCoeff_files)';

AeroCoeff_data = cell(1,n_AeroCoeff_files);

for i=1:n_AeroCoeff_files
    
    File = fullfile(directory_path,AeroCoeff_files(i).name);
    AeroCoeff_data{i} = readtable(File);
end