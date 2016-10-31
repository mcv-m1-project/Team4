%% ====================== Task 1 (Week 3) ====================== %%

clear all
close all
clc

dirMask = '../HSV';
maskFiles = dir(fullfile(dirMask,'*HSV.png')); % Get all .png files
tic
for i = 1:length(maskFiles)

    im = imread(fullfile(dirMask,maskFiles(i).name));

    CC = bwconncomp(im);
    nobj = CC.NumObjects;
    stats = regionprops(CC,'BoundingBox','Extent');

    boundingboxes = cat(1,stats.BoundingBox);
    fr = cat(1,stats.Extent);

    %Filtering part

    %We will filter the small objects, the big objecta and the objects with
    %incorrect filling ratio and aspect ratio
    %filling ratio in triangles = 1/2
    %filling ratio in circle = pi/4
    %Correct form factor = 1:1 
    delete = 0;
    d = 1;
    for k = 1:size(boundingboxes,1)
        ratio(k) = boundingboxes(k,3) ./ boundingboxes(k,4);
        if ((fr(k) > 0.4 && fr(k) < 0.6) || (fr(k) > 0.7 && fr(k) < 0.85) || (fr(k) > 0.9 && fr(k) <= 1)) && ((boundingboxes(k,3) > 30) || (boundingboxes(k,4) > 30)) && ((ratio(k) > 0.8) && (ratio(k) < 1.2))
        else    
            delete(d) = k;
            d = d + 1;
        end
    end
    
    if(delete~=0)
        boundingboxes(delete,:) = []; %We eliminate the objects that can't be a signal 
    end
    
    if(~isempty(boundingboxes))
        CCBoxes(:,1) = struct('x', boundingboxes(:,1), 'y', boundingboxes(:,2), 'w', boundingboxes(:,3), 'h', boundingboxes(:,4));
    else
        CCBoxes(:,1) = struct( 'x', 0, 'y', 0, 'w', 0, 'h', 0);
    end
    
    j=1;
    while j<=length(CCBoxes.x) % for each windowCanidate
        windowCandidates(j,1) = struct('x', CCBoxes.x(j), 'y', CCBoxes.y(j), 'w', CCBoxes.w(j), 'h', CCBoxes.h(j));
        j = j + 1;
    end 
    [pathstr_r,name_r, ext_r] = fileparts(maskFiles(i).name);
    save ([name_r, '.mat'], 'windowCandidates');
    clear windowCandidates
    
end

timeTask1 = toc;

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