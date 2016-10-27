close all
clear all
clc

dirname = 'train';
txtFiles = dir(fullfile([dirname '/gt'],'*.txt')); % get txt files

% read it to measure the coordinates, width, height and the bounding box
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

im = imread('mejora/A/mask.01.001796.HSV.png'); % read the image
im_width = size(im,2);
im_height = size(im,1);

w_width = w;
w_height = w;

%window = zeros(w_height,w_width);
window_area = w_height*w_width;
w_signal = {};
d = 1;
for i = 1:(im_height - w_height)
    for j = 1:(im_width - w_width)
        window = im(i:i + (w_height - 1), j:j + (w_width - 1));
        signal_area = sum(sum(window));
        %bbox_area = boundingboxes(k,3).*(boundingboxes(k,4));
        fr = signal_area / window_area;
        %if fr > 0.5
        if (fr > 0.4 && fr < 0.6) || (fr > 0.7 && fr < 0.85) || (fr > 0.9 && fr <= 1)
            w_signal{d} = window;
            w_position(d,:) = [j,i,w_height,w_width];
            d = d + 1;
        end
    end
end

dd = 1;
delete = 0;
for i = 1:(length(w_position)-1)
    if w_position(i,2) == w_position((i+1),2)
        delete(dd) = i;
        dd = dd + 1;  
    end
end

w_position(delete,:) = []; % delete boxes

%% Plot of the image and all the boxes

imshow(im); %Plot the image and the boxes
hold on
for k = 1:size(w_position,1)
    rectangle('position',w_position(k,:),'Edgecolor','g')
end

%% Plot of the image and only one box

imshow(im); %Plot the image and the boxes
hold on
rectangle('position',w_position(1,:),'Edgecolor','g')
  