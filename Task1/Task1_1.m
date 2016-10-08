clc
clear all;
close all;

%directory = '/Users/Toni/Desktop/Toni/Master/ProjectMaterials/Week 1/Code/train/gt';

i=1;                                    

dirname = '/Users/Toni/Desktop/Toni/Master/ProjectMaterials/Week 1/Code/train/gt';
txtFiles = dir(fullfile(dirname,'*.txt')); % tots els arxius .txt
kA = 0; kB = 0; kC = 0; kD = 0; kE = 0; kF = 0; % k indice total
% j repeticion de archivo
repeat = 0;

for k = 1:length(txtFiles)
  file = fullfile(dirname, txtFiles(k).name); %fitxer a fitxer
  fileID = fopen(file);
  data{k,1} = textscan(fileID,'%f %f %f %f %s');
  size = length(data{k}{1});
  j = 1;
  a = 0;
  
  while j <= size
      
      tly{k,1}(j)=data{k}{1}(j); % min_y           
      tlx{k,1}(j)=data{k}{2}(j); % min_x
      bry{k,1}(j)=data{k}{3}(j); % max_y  
      brx{k,1}(j) = data{k}{4}(j); % max_x
      type{k,1}(j) = data{k}{5}(j);
      width{k,1}(j) = abs(brx{k,1}(j) - tlx{k,1}(j));
      height{k,1}(j) = abs(bry{k,1}(j) - tly{k,1}(j));
      bbox{k,1}(j) = width{k,1}(j) .* height{k,1}(j);  % ground truth (bounding box)
      gt{k,1}(j,:) = [tlx{k,1}(j), tly{k,1}(j), brx{k,1}(j), bry{k,1}(j)]; 
      form_factor{k,1}(j) = width{k,1}(j) ./ height{k,1}(j); 
      
      if type{k,1}{j} == 'A'
        kA = kA + 1;
        tlyA{kA,1}(j) = tly{k,1}(j);
        tlyA{kA,2}(j) = k;
        tlxA{kA,1}(j) = tlx{k,1}(j);
        bryA{kA,1}(j) = bry{k,1}(j);
        brxA{kA,1}(j) = brx{k,1}(j);
      end
      
      if type{k,1}{j}=='B'
        kB = kB + 1;
        tlyB{kB,1}(j) = tly{k,1}(j);
        tlxB{kB,1}(j) = tlx{k,1}(j);
        bryB{kB,1}(j) = bry{k,1}(j);
        brxB{kB,1}(j) = brx{k,1}(j); 

      end
      
      if type{k,1}{j}=='C'
        kC = kC + 1;
        tlyC{kC,1}(j) = tly{k,1}(j);
        tlxC{kC,1}(j) = tlx{k,1}(j);
        bryC{kC,1}(j) = bry{k,1}(j);
        brxC{kC,1}(j) = brx{k,1}(j); 
      end
      
      if type{k,1}{j}=='D'
        kD = kD + 1;
        tlyD{kD,1}(j) = tly{k,1}(j);
        tlxD{kD,1}(j) = tlx{k,1}(j);
        bryD{kD,1}(j) = bry{k,1}(j);
        brxD{kD,1}(j) = brx{k,1}(j); 
      end
      
      if type{k,1}{j}=='E'
        kE = kE + 1;
        tlyE{kE,1}(j) = tly{k,1}(j);
        tlxE{kE,1}(j) = tlx{k,1}(j);
        bryE{kE,1}(j) = bry{k,1}(j);
        brxE{kE,1}(j) = brx{k,1}(j); 
      end
      
      if type{k,1}{j}=='F'
        kF = kF +1 ;
        tlyF{kF,1}(j) = tly{k,1}(j);
        tlxF{kF,1}(j) = tlx{k,1}(j);
        bryF{kF,1}(j) = bry{k,1}(j);
        brxF{kF,1}(j) = brx{k,1}(j); 
      end
      
      if j > 1 && a == 0
        repeat = repeat + 1;
        a = 1;
      end
      
      j=j+1;  
      
  end
       
    fclose all;                        

end

fr_A = 1/2; %
fr_B = 1/2; %
fr_C = pi; %
fr_D = pi; %
fr_E = pi; %
fr_F = 1; %
