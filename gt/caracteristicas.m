function [formfactor, fillingratio, maxsize, minsize] = caracteristicas (listado, directory)
% [a,b,c,d,e]= textread(listado(i).name, '%f %f %f %f %s');
    %tly(i)=a;
%tly = [];
%tlx = [];
%bry = [];
%brx = [];
%tipo = [];

for i=1:length(listado)
    fileID = fopen(listado(i).name);
    tline=fgetl(fileID)
    %c=textscan(fileID,'%f %f %f %f %s');
    
end
end
   
    
    