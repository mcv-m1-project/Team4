function gt = getGroundTruth(txtFiles, dirname)
    % getGroundTruth
    % Get each getGroundTruth from all datasets
    %
    %    Parameter name      Value
    %    --------------      -----
    %    'txtFiles'         All Txt Files /gt
    %    'dirname'          Current directory of all dataset
    
    
    disp('Getting Originals Ground Truth ...');
    for k = 1:length(txtFiles)
        j = 1; % Index to count number of each signal type

        fileTxt = fullfile([dirname '/gt'], txtFiles(k).name); % File by File

        fileTxtID = fopen(fileTxt);
        dataTxt{k,1} = textscan(fileTxtID,'%f %f %f %f %s');
        size = length(dataTxt{k}{1}); % Number of signals for each txt file

        while j <= size
            tly{k,1}(j) = dataTxt{k}{1}(j); % save minY          
            tlx{k,1}(j) = dataTxt{k}{2}(j); % save minX
            bry{k,1}(j) = dataTxt{k}{3}(j); % save maxY  
            brx{k,1}(j) = dataTxt{k}{4}(j); % save maxX
            width{k,1}(j) = abs(brx{k,1}(j) - tlx{k,1}(j)); % widht of each Ground Truth (maxX-minX)
            height{k,1}(j) = abs(bry{k,1}(j) - tly{k,1}(j)); % height of each Ground Truth (maxY-minY)

            gt{k,1}(j,1) = struct( 'x', tlx{k,1}(j), 'y', tly{k,1}(j), 'width', width{k,1}(j), 'height', height{k,1}(j));
            
            j=j+1;
        end

        fclose all;                        
    end
	
    disp('Done.');
end