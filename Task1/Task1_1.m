clc
clear all;
close all;

%directory = '/Users/Toni/Desktop/Toni/Master/ProjectMaterials/Week 1/Code/train/gt';

% a = dir (directory);   %llegir directori
% 
% listado = [];          
% 
% largada = length (a);
% 
% for i =1:largada
%         if (strcmp (a(i).name(1),'g')) == 1     %al llegir els arxius de text del directori, si la primera lletra es g, s'inclou dins
%             listado = [listado ; a(i)];         %del llistat d'arxius amb els que treballarem.
%         end
% 
% end

%function [tly, tlx, bry, brx, tipo] = caracteristicas(listado, directory)  %entrem les variables directory i el listado

% tly = [];                               %tipo no la defineixo ja que em donava problemes amb els índex.
% tlx = [];
% bry = [];
% brx = [];

i=1;                                    %hi hauran dos contejos, K per a llegir cada arxiu i "i" per llegir les imatges ja que en un arxiu
                                        %poden haver-hi dues o mes imatges (per tant k és diferent a i!!, tindrem més imatges que arxius)
                                    
dirname = uigetdir; % posar directori /train/gt quan s'obri finestra
txtFiles = dir(fullfile(dirname,'*.txt')); % tots els arxius .txt

for k = 1:length(txtFiles)
  file = fullfile(dirname, txtFiles(k).name); %fitxer a fitxer
  fileID = fopen(file);
  data(k,:) = textscan(fileID,'%f %f %f %f %s');
  
  if length(data{k,5})<=1                  %per saber si hi ha una senyal o més al arxiu que hem llegit, mirem la llargada de c{5} (tipus de senyal)
        tly(k,:)=data{1};                    %si la llargada és 1, llavors directamen escrivim cada característica a la variable corresponent
        tlx(k,:)=data{2};
        bry(k,:)=data{3};
        brx(k,:)=data{4};
        type(k,:)=data{5};                      %avegades si ficava directament el c{5} al tipus(i) em donava error :/ per aixo he creat la variable type
        %tipo(k,:)=type;
        i=i+1;                          %com que ja he omplert les variables pel primer arxiu, sumo 1 a l'índex i (quantitat imatges)
    else
        cantidadsenales=length(data{k,5});   %si hi han més d'una imatge per arxiu entro en aquesta part.
        y1=data{1};                        %al haver-hi un c{1} = nº1 nº2, necessito copiar-los a una variable per poder assigar-los després
        x1=data{2};
        y2=data{3};
        x2=data{4};
        type=data{5};        
        j=0;                            %inicialitzo un tercer conteo, aquest serà per sumar posicions a a les imatges, és a dir, si tinc omplert fins tly(5), i a l'arxiu 6 hi han dues imatges, necessito omplir el tly(6) i tly(7), per això creo la j.
        
        while j < cantidadsenales        %mentres que j sigui mes petit que la llargada (és a dir, j< que la quantitat d'imatges per arxiu), fico < i no <= per a que després li sumo una.
            tly(k+j)=y1(j+1);           %la posició tly(i+j) serà el y(1), que és el primer nº de c{1}, el segon número es ficarà un cop j=1 (comencem amb j=0). j ha de començar a 0 ja que sino ficaríem el valor y(1) a l'index i+j!! (si j comencés a 1 ens estaríem saltant un índex que s'inicialitzaria a 0)
            tlx(k+j)=x1(j+1);
            bry(k+j)=y2(j+1);
            brx(k+j)=x2(j+1);
            tipo(k+j)= type(j+1);
            j=j+1;                      % sumo 1 al valor de j
        end
        
        %k=k+j;
        %fclose(fileID);
  end    

  
    fclose all;                           %si no ficava aquesta línia em petava.

end