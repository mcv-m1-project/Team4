clc
clear all;
close all;

directory = 'train/gt';

i=1;                                    
dirname = directory;
txtFiles = dir(fullfile(dirname,'*.txt')); % Get all .txt files

directory='train/mask';
dirname2=directory
masks=dir(fullfile(dirname2,'*.png'));%get all.png files
kA = 0; kB = 0; kC = 0; kD = 0; kE = 0; kF = 0; % k Index to each signal type
repeat = 0; tTestSignals = 0; % Test Debug

for k = 1:length(txtFiles)
    file = fullfile(dirname, txtFiles(k).name); % fitxer a fitxer
    fileID = fopen(file);
    data{k,1} = textscan(fileID,'%f %f %f %f %s');
    size = length(data{k}{1}); % Number of signals of each txt file
    maskfile=fullfile(dirname2,masks(k).name);
    M=imread(maskfile);
    j = 1; % Index to count number of each signal type
    a = 0; % Test Debug
  
    while j <= size
        tly{k,1}(j) = data{k}{1}(j); % save minY          
        tlx{k,1}(j) = data{k}{2}(j); % save minX
        bry{k,1}(j) = data{k}{3}(j); % save maxY  
        brx{k,1}(j) = data{k}{4}(j); % save maxX
        type{k,1}(j) = data{k}{5}(j); % save signal type
        width{k,1}(j) = abs(brx{k,1}(j) - tlx{k,1}(j)); % widht of each Ground Truth (maxX-minX)
        height{k,1}(j) = abs(bry{k,1}(j) - tly{k,1}(j)); % height of each Ground Truth (maxY-minY)
        form_factor{k,1}(j) = width{k,1}(j) ./ height{k,1}(j); % Form Factor (Width/Height)
        bbox{k,1}(j) = width{k,1}(j) .* height{k,1}(j);  % Area of eaech Ground Truth (bounding box)
        gt{k,1}(j,:) = [tlx{k,1}(j), tly{k,1}(j), brx{k,1}(j), bry{k,1}(j)]; % Ground Truth (bounding box) [minX minY maxX maxY]
        M1=graythresh(M);
        M2=im2bw(M,M1);
        M3=M2((fix(tly{k,1}(j))):(fix(bry{k,1}(j))),(fix(tlx{k,1}(j))):(fix(brx{k,1}(j))));
        area=bwarea(M3);
        Fratio{k,1}(j)=area/(bbox{k,1}(j));
        
        if type{k,1}{j} == 'A'
            kA = kA + 1;
            tlyA{kA,1}(j) = tly{k,1}(j);
            tlyA{kA,2}(j) = k;
            tlxA{kA,1}(j) = tlx{k,1}(j);
            tlxA{kA,2}(j) = k;
            bryA{kA,1}(j) = bry{k,1}(j);
            bryA{kA,2}(j) = k;
            brxA{kA,1}(j) = brx{k,1}(j);
            brxA{kA,2}(j) = k;
            % Save new cell A with only A signal type {kA,1}(k index, Txt FileName)
            A{kA,1}(j) = k;
            A{kA,2} = txtFiles(k).name; % Save 
        end

        if type{k,1}{j} == 'B'
            kB = kB + 1;
            tlyB{kB,1}(j) = tly{k,1}(j);
            tlyB{kB,2}(j) = k;
            tlxB{kB,1}(j) = tlx{k,1}(j);
            tlxB{kB,2}(j) = k;
            bryB{kB,1}(j) = bry{k,1}(j);
            bryB{kB,2}(j) = k;
            brxB{kB,1}(j) = brx{k,1}(j); 
            brxB{kB,2}(j) = k;
            B{kB,1}(j) = k;
            B{kB,2} = txtFiles(k).name; 
        end

        if type{k,1}{j} == 'C'
            kC = kC + 1;
            tlyC{kC,1}(j) = tly{k,1}(j);
            tlyC{kC,2}(j) = k;
            tlxC{kC,1}(j) = tlx{k,1}(j);
            tlxC{kC,2}(j) = k;
            bryC{kC,1}(j) = bry{k,1}(j);
            bryC{kC,2}(j) = k;
            brxC{kC,1}(j) = brx{k,1}(j); 
            brxC{kC,2}(j) = k;
            C{kC,1}(j) = k;
            C{kC,2} = txtFiles(k).name; 
        end

        if type{k,1}{j} == 'D'
            kD = kD + 1;
            tlyD{kD,1}(j) = tly{k,1}(j);
            tlyD{kD,2}(j) = k;
            tlxD{kD,1}(j) = tlx{k,1}(j);
            tlxD{kD,2}(j) = k;
            bryD{kD,1}(j) = bry{k,1}(j);
            bryD{kD,2}(j) = k;
            brxD{kD,1}(j) = brx{k,1}(j);
            brxD{kD,2}(j) = k;
            D{kD,1}(j) = k;
            D{kD,2} = txtFiles(k).name; 
        end

        if type{k,1}{j} == 'E'
            kE = kE + 1;
            tlyE{kE,1}(j) = tly{k,1}(j);
            tlyE{kE,2}(j) = k;
            tlxE{kE,1}(j) = tlx{k,1}(j);
            tlxE{kE,2}(j) = k;
            bryE{kE,1}(j) = bry{k,1}(j);
            bryE{kE,2}(j) = k;
            brxE{kE,1}(j) = brx{k,1}(j); 
            brxE{kE,2}(j) = k;
            E{kE,1}(j) = k;
            E{kE,2} = txtFiles(k).name; 
        end

        if type{k,1}{j} == 'F'
            kF = kF +1 ;
            tlyF{kF,1}(j) = tly{k,1}(j);
            tlyF{kF,2}(j) = k;
            tlxF{kF,1}(j) = tlx{k,1}(j);
            tlxF{kF,2}(j) = k;
            bryF{kF,1}(j) = bry{k,1}(j);
            bryF{kF,2}(j) = k;
            brxF{kF,1}(j) = brx{k,1}(j); 
            brxF{kF,2}(j) = k;
            F{kF,1}(j) = k;
            F{kF,2} = txtFiles(k).name; 
        end

        % ------------------ Only for TestDebug ------------------ %
        if j > 1 && a == 0 % Get the number of repeat files with a repeat count
            repeat = repeat + 1;
            a = 1;
        end
        tTestSignals = tTestSignals + 1;
        % -------------------------------------------------------- %

        j=j+1;  
    end

    fclose all;                        

end

% Filling Ratio   Experimental!!!!!!!!!!!!!!!!!! hacer de nuevo
fr_A = 1/2; % Triangle
fr_B = 1/2; % Triangle
fr_C = pi/4; % Circle
fr_D = pi/4; % Circle
fr_E = pi/4; % Circle
fr_F = 1; % Square

% Test PerCent(%) Total Signal
total_signal = length(A) + length(B) + length(C) + length(D) + length(E) + length(F);
total_A = length(A)/total_signal;
total_B = length(B)/total_signal;
total_C = length(C)/total_signal;
total_D = length(D)/total_signal;
total_E = length(E)/total_signal;
total_F = length(F)/total_signal;
total = sum(total_A + total_B + total_C + total_D + total_E + total_F);