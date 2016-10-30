close all
clear all
clc

dirTxt = '../train';
w = getWindowSize(dirTxt); % Get Optimal Width and Height using TxtFiles

w_width = w;
w_height = w;

window = zeros(w_height,w_width);
window_area = w_height*w_width;
dirMask = 'mejora';
maskFiles = dir(fullfile(dirMask,'*HSV.png')); % Get all .png files

tic
for k = 1:length(maskFiles)
    w_pos = [0, 0, 0, 0];
    im = imread(fullfile(dirMask,maskFiles(k).name)); % read the image
    im_width = size(im,2);
    im_height = size(im,1);

    d = 1;
    imfilt = conv2(1/window_area*ones(w),double(im));
    
    for i=1:im_height
        for j=1:im_width
            if (imfilt(i,j) > 0.4 && imfilt(i,j) < 0.6) || (imfilt(i,j) > 0.7 && imfilt(i,j) < 0.85) || (imfilt(i,j) > 0.9 && imfilt(i,j) <= 1) 
                w_pos(d,:) = [j-w,i-w,w_width,w_height];
                d = d + 1;
            end
        end
    end
    
    if isempty(w_pos)
        w_pos = [0, 0, 0, 0];
        disp('Empty');
    else
   
        [unic, ia] = unique(w_pos(:,1)); % x vector
        w_pos = w_pos(ia,:);
        w_pos = w_pos(1:10:end,:);
        % freq = [unic,histc(w_position(:,1),unic)];

    end
    windowCandidates(k,:) = struct('x', w_pos(:,1), 'y' , w_pos(:,2), 'w', w_pos(:,3), 'h', w_pos(:,4));
    clear w_pos
end

timeTask5 = toc;

%% Result: List Of Bounding Boxes containing a detection

% save as .mat file
save windowCandidates

%%

for i = 1:length(maskFiles)     
    imshow(imread(fullfile(dirMask,maskFiles(i).name))); %Plot the image and the boxes   
    hold on  
    for j = 1:length(windowCandidates(i).x)       
        rectangle('position',[windowCandidates(i).x(j), windowCandidates(i).y(j), windowCandidates(i).w(j), windowCandidates(i).h(j)],'Edgecolor','g')    
    end
    pause(); 
end