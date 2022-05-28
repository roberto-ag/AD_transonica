%---------------------------------------------------------------------------------%
% Lector de archivos .txt del surface_flow
% Autor: Roberto Allely García
% Fecha: 26/05/2022 20:40
% Archivos usados: Surface_flow
%---------------------------------------------------------------------------------%

directory_path = pwd;
Surface_files = dir(fullfile(directory_path,'*.txt'));
n_Surface_files = length(Surface_files);

name_Surface_files = {Surface_files.name};
name_Surface_files = convertCharsToStrings(name_Surface_files)';

Surface_data = cell(1,n_Surface_files);


for i=1:n_Surface_files
    
    File = fullfile(directory_path,Surface_files(i).name);
    Surface_data{i} = readtable(File);
end

