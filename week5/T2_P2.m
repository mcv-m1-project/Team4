%% ====================== Task 1 (Week 5) ====================== %%
% UCM

clear all 
close all
clc

addpath('MCG-PreTrained')
%cd MCG-PreTrained
root_dir = '/Users/Toni/Desktop/Toni/Master/M1/ProjectMaterials/Week 5/MCG-PreTrained';
install
dirname = 'Validation';
% imgFiles = dir(fullfile(dirname,'*.jpg')); % Get all the images
% dir_ucm = 'UCM_Images';
imgFiles = dir(fullfile(dirname,'*.jpg')); % Get all the images

% r = {};
% c = {};
% for i = 1:length(u)
%     [r{i,1},c{i,1}] = find(seg == u(i));
%     area(i,1) = length(r{i,1})/(size(;
% end
% 
% area = mean(l)/(s;

i = 1;
d = 1;
for f = 1:length(imgFiles)
    [pathstr_i,name_i,ext_i]=fileparts(imgFiles(f).name);
    ima = imread([dirname, '/' name_i, '.jpg']);
    seg = segment_ucm(ima, 0.8);
    u = unique(seg);
    w = 1;
    w_pos(w,:) = [0, 0, 0, 0];
    for i = 1:length(u) 
        BW=(seg==i);
        stats = regionprops(BW,'BoundingBox','Extent','Orientation','ConvexArea','Solidity');
        boundingboxes = cat(1,stats.BoundingBox);
        fr = cat(1,stats.Extent);
        perc = (stats.ConvexArea/(size(BW,1)*size(BW,2)))*100;
        orientation = stats.Orientation;
        solidity = stats.Solidity;
        if ((perc > 0.05) && (perc < 0.9)) %&& (orientation > -17) && (orientation < 17))
        for k = 1:size(boundingboxes,1)
            ratio(k) = boundingboxes(k,3) ./ boundingboxes(k,4);
            if ((fr(k) > 0.4 && fr(k) <= 1.1)) && ((boundingboxes(k,3) > 30) || (boundingboxes(k,4) > 40)) && ((ratio(k) > 0.9) && (ratio(k) < 1.3))        
                w_pos(d,:) = [boundingboxes(1),boundingboxes(2),boundingboxes(3),boundingboxes(4)];
                d = d + 1;
                %figure(1);imshow(BW);pause();
            end
        end
        end
    end
    
%     z = 1;
%     
%     if(isempty(w_pos))
%         w_pos(z,:) = struct( 'x', 0, ... 
%                'y', 0, ... 
%                'w', 0, ... 
%                'h', 0);
%     end

    CCBoxes(:,1) = struct('x', w_pos(:,1), 'y' , w_pos(:,2), 'w', w_pos(:,3), 'h', w_pos(:,4)); 
    clear w_pos
    j = 1; 

    clear windowCandidates
    while j<=length(CCBoxes.x) % for each windowCanidate         
        windowCandidates(j,1) = struct('x', CCBoxes.x(j), 'y', CCBoxes.y(j), 'w', CCBoxes.w(j), 'h', CCBoxes.h(j));
        j = j + 1;   
    end
    
    [pathstr_r,name_r, ext_r] = fileparts(imgFiles(f).name);
    save (['ValidationMat/', name_r, '.mat'], 'windowCandidates');
    f   
%         figure(1); 
%         imshow(imread(fullfile('UCM_Images/',imgFiles(i).name)));
%         hold on  
%         for j = 1:length(windowCandidates)   
%         rectangle('position',[windowCandidates(j).x, windowCandidates(j).y, windowCandidates(j).w, windowCandidates(j).h],'Edgecolor','g') %  
%         end 
%         pause();
end