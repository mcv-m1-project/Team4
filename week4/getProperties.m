function [propA, propB, propC, propD, propE, propF] = getProperties(dirname,txtFiles)
    
    disp('Getting Originals Ground Truth ...');
    kA = 0; kB = 0; kC = 0; kD = 0; kE = 0; kF = 0; % k Index to each signal type

    
    for k = 1:length(txtFiles)
        j = 1; % Index to count number of each signal type

        fileTxtID = fopen([dirname '/gt/' txtFiles(k).name]);
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
            j=j+1;
        end

        fclose all;
        
        j = 1;
        if type{k,1}{j} == 'A'
                kA = kA + 1;
                propA(kA,:) = [width{k,1}(j) .* height{k,1}(j), width{k,1}(j) ./ height{k,1}(j)]; % Form Factor (Width/Height)
            elseif type{k,1}{j} == 'B'
                kB = kB + 1;
                propB(kB,:) = [width{k,1}(j) .* height{k,1}(j), width{k,1}(j) ./ height{k,1}(j)]; % Form Factor (Width/Height)
            elseif type{k,1}{j} == 'C'
                kC = kC + 1;
                propC(kC,:) = [width{k,1}(j) .* height{k,1}(j), width{k,1}(j) ./ height{k,1}(j)]; % Form Factor (Width/Height)
            elseif type{k,1}{j} == 'D'
                kD = kD + 1;
                propD(kD,:) = [width{k,1}(j) .* height{k,1}(j), width{k,1}(j) ./ height{k,1}(j)]; % Form Factor (Width/Height)
            elseif type{k,1}{j} == 'E'
                kE = kE +1;
                propE(kE,:) = [width{k,1}(j) .* height{k,1}(j), width{k,1}(j) ./ height{k,1}(j)]; % Form Factor (Width/Height)
            elseif type{k,1}{j} == 'F'
                kF = kF +1;
                propF(kF,:) = [width{k,1}(j) .* height{k,1}(j), width{k,1}(j) ./ height{k,1}(j)]; % Form Factor (Width/Height)
            end
    end
    
    disp('Done.');
end