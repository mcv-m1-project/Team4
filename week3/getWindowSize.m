function w = getWindowSize(dirname)

% read it to measure the coordinates, width, height and the bounding box
txtFiles = dir(fullfile([dirname '/gt'],'*.txt')); % get txt files

for k = 1:length(txtFiles)
    j = 1; % Index to count number of each signal type
    a = 0; % Test Debug

    fileTxt = fullfile([dirname '/gt'], txtFiles(k).name); % File by File
    fileTxtID = fopen(fileTxt);
    dataTxt{k,1} = textscan(fileTxtID,'%f %f %f %f %s');
    
    tly{k,1}(j) = dataTxt{k}{1}(j); % save minY          
    tlx{k,1}(j) = dataTxt{k}{2}(j); % save minX
    bry{k,1}(j) = dataTxt{k}{3}(j); % save maxY  
    brx{k,1}(j) = dataTxt{k}{4}(j); % save maxX
    width{k,1}(j) = abs(brx{k,1}(j) - tlx{k,1}(j)); % widht of each Ground Truth (maxX-minX)
    height{k,1}(j) = abs(bry{k,1}(j) - tly{k,1}(j)); % height of each Ground Truth (maxY-minY)
    bbox{k,1}(j) = width{k,1}(j) .* height{k,1}(j);             

    fclose all;                        
end

% calculate the mean of width
w_bbox = 0;
for i = 1:length(width)
    w_bbox = w_bbox + width{i,1};
end
w_bbox = round(w_bbox/length(width));

% calculate the mean of height
h_bbox = 0;
for i = 1:length(height)
    h_bbox = h_bbox + height{i,1};
end
h_bbox = round(h_bbox/length(height)); 

w = [w_bbox h_bbox];
w = round(mean(w)); % final window