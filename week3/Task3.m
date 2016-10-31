%% ====================== Task 3 (Week 3) ====================== %%

close all
clear all
clc

dirTxt = '../train';
dirMask = '../HSV';

w = getWindowSize(dirTxt); % Get Optimal Width and Height using TxtFiles
w_width = w;
w_height = w;

window = zeros(w_height,w_width);
window_area = w_height*w_width;

maskFiles = dir(fullfile(dirMask,'*HSV.png')); % Get all HSV.png files

tic
for k = 1:length(maskFiles)
    w_pos = [0, 0, 0, 0];
    im = imread(fullfile(dirMask,maskFiles(k).name)); % read each image
    im_width = size(im,2);
    im_height = size(im,1);
    inte2 = cumsum(cumsum(double(im)),2);

    d = 1;
    for i = 1:(im_height - w_height)
        for j = 1:(im_width - w_width)
            window = im(i:i + (w_height - 1), j:j + (w_width - 1));
            regionSum = inte2(i+w_height-1,j+w_width-1) + inte2(i,j) - inte2(i,j+w_width-1) - inte2(i+w_height-1,j);
            fr = regionSum / window_area;            
            if (fr > 0.4 && fr < 0.6) || (fr > 0.7 && fr < 0.85) || (fr > 0.9 && fr <= 1)
                w_pos(d,:) = [j,i,w_width,w_height];
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
    end
    k
    
    CCBoxes(:,1) = struct('x', w_pos(:,1), 'y' , w_pos(:,2), 'w', w_pos(:,3), 'h', w_pos(:,4));
    clear w_pos
    
    j=1;
    while j<=length(CCBoxes.x) % for each windowCanidate
        windowCandidates(j,1) = struct('x', CCBoxes.x(j), 'y', CCBoxes.y(j), 'w', CCBoxes.w(j), 'h', CCBoxes.h(j));
        j = j + 1;
    end
    
    [pathstr_r,name_r, ext_r] = fileparts(maskFiles(k).name);
    save ([name_r, '.mat'], 'windowCandidates');
    clear windowCandidates
end
timeTask3 = toc;

%% Save as .mat File
% save windowCandidates

%% Plot of all the images and rectangles
% for i = 1:length(maskFiles)
%     imshow(imread(fullfile(dirMask,maskFiles(i).name)));
%     
%     hold on
%     for j = 1:length(windowCandidates(i).x)
%         rectangle('position',[windowCandidates(i).x(j), windowCandidates(i).y(j), windowCandidates(i).w(j), windowCandidates(i).h(j)],'Edgecolor','g')
%     end
%     pause();
% end