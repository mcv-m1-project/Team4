function [sA, sB, sC, sD, sE, sF] = getParameters(txtFiles, maskFiles, dirname)
    % getParameters
    % Get each signal type from all datasets and get its parameters in a struct value
    %
    %    Parameter name      Value
    %    --------------      -----
    %    'txtFiles'         All Txt Files /gt
    %    'maskFiles'        All PNG Mask Files /mask
    %    'dirname'          Current directory of all dataset
    
    kA = 0; kB = 0; kC = 0; kD = 0; kE = 0; kF = 0; % k Index to each signal type
    repeat = 0; tTestSignals = 0; % Test Debug
    
    disp('Splitting Files ...');
    for k = 1:length(txtFiles)
        j = 1; % Index to count number of each signal type
        a = 0; % Test Debug

        fileTxt = fullfile([dirname '/gt'], txtFiles(k).name); % File by File
        M = imread(fullfile([dirname '/mask'],maskFiles(k).name)); % Read the mask

        fileTxtID = fopen(fileTxt);
        dataTxt{k,1} = textscan(fileTxtID,'%f %f %f %f %s');
        size = length(dataTxt{k}{1}); % Number of signals for each txt file

        while j <= size
            tly{k,1}(j) = dataTxt{k}{1}(j); % save minY          
            tlx{k,1}(j) = dataTxt{k}{2}(j); % save minX
            bry{k,1}(j) = dataTxt{k}{3}(j); % save maxY  
            brx{k,1}(j) = dataTxt{k}{4}(j); % save maxX
            type{k,1}(j) = dataTxt{k}{5}(j); % save signal type
            width{k,1}(j) = abs(brx{k,1}(j) - tlx{k,1}(j)); % widht of each Ground Truth (maxX-minX)
            height{k,1}(j) = abs(bry{k,1}(j) - tly{k,1}(j)); % height of each Ground Truth (maxY-minY)
            form_factor{k,1}(j) = width{k,1}(j) ./ height{k,1}(j); % Form Factor (Width/Height)
            bbox{k,1}(j) = width{k,1}(j) .* height{k,1}(j);  % Area of each Ground Truth (bounding box)
            gt{k,1}(j,:) = [tlx{k,1}(j), tly{k,1}(j), brx{k,1}(j), bry{k,1}(j)]; % Ground Truth (bounding box) [minX minY maxX maxY]

            M1 = graythresh(M); % Get level threshold to convert then in a binary image
            M2 = im2bw(M,M1); % Convert image to binary image
            if fix(tly{k,1}(j) == 0 | fix(tlx{k,1}(j))) == 0    
                M3 = M2((round(tly{k,1}(j))):(round(bry{k,1}(j))),(round(tlx{k,1}(j))):(round(brx{k,1}(j))));
            else
                M3 = M2((fix(tly{k,1}(j))):(fix(bry{k,1}(j))),(fix(tlx{k,1}(j))):(fix(brx{k,1}(j))));
            end
            area = bwarea(M3); % Signal area extracted from each mask
            FR{k,1}(j) = area / bbox{k,1}(j);

            if type{k,1}{j} == 'A'
                kA = kA + 1;
                sA{kA,1} = struct('tly', tly{k,1}(j), 'tlx', tlx{k,1}(j), 'bry', bry{k,1}(j), 'brx', brx{k,1}(j), 'w', width{k,1}(j), 'h', height{k,1}(j), 'bbox', bbox{k,1}(j), 'fr', FR{k,1}(j), 'ff', form_factor{k,1}(j), 'type', type{k,1}(j), 'name', txtFiles(k).name,'k', k);
            elseif type{k,1}{j} == 'B'
                kB = kB + 1;
                sB{kB,1} = struct('tly', tly{k,1}(j), 'tlx', tlx{k,1}(j), 'bry', bry{k,1}(j), 'brx', brx{k,1}(j), 'w', width{k,1}(j), 'h', height{k,1}(j), 'bbox', bbox{k,1}(j), 'fr', FR{k,1}(j), 'ff', form_factor{k,1}(j), 'type', type{k,1}(j), 'name', txtFiles(k).name,'k', k);
            elseif type{k,1}{j} == 'C'
                kC = kC + 1;
                sC{kC,1} = struct('tly', tly{k,1}(j), 'tlx', tlx{k,1}(j), 'bry', bry{k,1}(j), 'brx', brx{k,1}(j), 'w', width{k,1}(j), 'h', height{k,1}(j), 'bbox', bbox{k,1}(j), 'fr', FR{k,1}(j), 'ff', form_factor{k,1}(j), 'type', type{k,1}(j), 'name', txtFiles(k).name,'k', k);
            elseif type{k,1}{j} == 'D'
                kD = kD + 1;
                sD{kD,1} = struct('tly', tly{k,1}(j), 'tlx', tlx{k,1}(j), 'bry', bry{k,1}(j), 'brx', brx{k,1}(j), 'w', width{k,1}(j), 'h', height{k,1}(j), 'bbox', bbox{k,1}(j), 'fr', FR{k,1}(j), 'ff', form_factor{k,1}(j), 'type', type{k,1}(j), 'name', txtFiles(k).name,'k', k);
            elseif type{k,1}{j} == 'E'
                kE = kE +1;
                sE{kE,1} = struct('tly', tly{k,1}(j), 'tlx', tlx{k,1}(j), 'bry', bry{k,1}(j), 'brx', brx{k,1}(j), 'w', width{k,1}(j), 'h', height{k,1}(j), 'bbox', bbox{k,1}(j), 'fr', FR{k,1}(j), 'ff', form_factor{k,1}(j), 'type', type{k,1}(j), 'name', txtFiles(k).name,'k', k); 
            elseif type{k,1}{j} == 'F'
                kF = kF +1;
                sF{kF,1} = struct('tly', tly{k,1}(j), 'tlx', tlx{k,1}(j), 'bry', bry{k,1}(j), 'brx', brx{k,1}(j), 'w', width{k,1}(j), 'h', height{k,1}(j), 'bbox', bbox{k,1}(j), 'fr', FR{k,1}(j), 'ff', form_factor{k,1}(j), 'type', type{k,1}(j), 'name', txtFiles(k).name,'k', k); 
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

    % Test PerCent(%) Total Signal
    
    disp('=========== TestDebug ===========');
    total_signal = length(sA) + length(sB) + length(sC) + length(sD) + length(sE) + length(sF);
    total_A = length(sA)/total_signal;
    total_B = length(sB)/total_signal;
    total_C = length(sC)/total_signal;
    total_D = length(sD)/total_signal;
    total_E = length(sE)/total_signal;
    total_F = length(sF)/total_signal;
    total = sum(total_A + total_B + total_C + total_D + total_E + total_F)
    disp('=================================');
    if total
        disp('Files Splitted!! Done.');
    end
end
