function gt = getParameters(txtFiles, dirname)
    % getParameters
    % Get each signal type from all datasets and get its parameters in a struct value
    %
    %    Parameter name      Value
    %    --------------      -----
    %    'txtFiles'         All Txt Files /gt
    %    'dirname'          Current directory of all dataset
    
    
    disp('Getting Original BoundingBox ...');
    for k = 1:length(txtFiles)
        j = 1; % Index to count number of each signal type
        a = 0; % Test Debug

        fileTxt = fullfile([dirname '/gt'], txtFiles(k).name); % File by File

        fileTxtID = fopen(fileTxt);
        dataTxt{k,1} = textscan(fileTxtID,'%f %f %f %f %s');
        size = length(dataTxt{k}{1}); % Number of signals for each txt file

        while j <= size
            tly{k,1}(j) = dataTxt{k}{1}(j); % save minY          
            tlx{k,1}(j) = dataTxt{k}{2}(j); % save minX
            bry{k,1}(j) = dataTxt{k}{3}(j); % save maxY  
            brx{k,1}(j) = dataTxt{k}{4}(j); % save maxX
            type{k,1}(j) = dataTxt{k}{5}(j); % save signal type
            gt{k,1}(j,:) = [tlx{k,1}(j), tly{k,1}(j), brx{k,1}(j), bry{k,1}(j)]; % Ground Truth (bounding box) [minX minY maxX maxY]

            j=j+1;  
        end

        fclose all;                        
    end
	
    disp('Done.');
end
