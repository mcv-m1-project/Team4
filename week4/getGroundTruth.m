function gt = getGroundTruth(gtTxtFiles, dirname)
    % getGroundTruth
    % Get each getGroundTruth from all datasets
    %
    %    Parameter name      Value
    %    --------------      -----
    %    'gtTxtFiles'        All Txt Files /gt
    %    'dirname'           Current directory of all dataset
    
    
    disp('Getting Originals Ground Truth ...');
    for k = 1:length(gtTxtFiles)
        j = 1; % Index to count number of each signal type
        
        toSplit = strsplit(gtTxtFiles(k).name,{'mask.','.HSV.png'}); % Split the String of the file's name  
        fileTxt = fullfile([dirname '/gt'], strjoin(['gt.' toSplit(2) '.txt'],'')); % File by File
        fileTxtID = fopen(fileTxt); % ID of the file
        dataTxt{k,1} = textscan(fileTxtID,'%f %f %f %f %s'); % Read data from an open text file identified
        size = length(dataTxt{k}{1}); % Number of signals for each txt file

        while j <= size
            tly{k,1}(j) = dataTxt{k}{1}(j); % save minY          
            tlx{k,1}(j) = dataTxt{k}{2}(j); % save minX
            bry{k,1}(j) = dataTxt{k}{3}(j); % save maxY  
            brx{k,1}(j) = dataTxt{k}{4}(j); % save maxX
            width{k,1}(j) = abs(brx{k,1}(j) - tlx{k,1}(j)); % widht of each Ground Truth (maxX-minX)
            height{k,1}(j) = abs(bry{k,1}(j) - tly{k,1}(j)); % height of each Ground Truth (maxY-minY)
            
            % Get the Ground Truth in a struct with the values obtained
            % before (x, y, w, h)
            gt(k,:) = struct('x', tlx{k,1}(j), 'y', tly{k,1}(j), 'w', width{k,1}(j), 'h', height{k,1}(j));
            
            j=j+1; % + 1 if there is more than one signal
        end
        
        fclose all; % Close the file associated with the corresponent file identifier                       
   
    end
	
    disp('Done.');
end