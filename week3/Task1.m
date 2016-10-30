clear all
close all
clc

dirname = '../HSV';
maskFiles = dir(fullfile([dirname],'*HSV.png')); % Get all .png files
tic
for i = 1:length(maskFiles)

    im = imread(fullfile([dirname],maskFiles(i).name));

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
        windowCandidates(i,:) = struct('x', boundingboxes(:,1), 'y', boundingboxes(:,2), 'w', boundingboxes(:,3), 'h', boundingboxes(:,4));
    else
        windowCandidates(i,:) = struct( 'x', 0, 'y', 0, 'w', 0, 'h', 0);
    end
    
end

timeTask1 = toc;

%% Save as .mat File
save windowCandidates 

%% %Plot the images and the rectangles
imshow(im); 
hold on
for k = 1:size(windowCandidates,2)
    rectangle('position',[windowCandidates(i).x, windowCandidates(i).y, windowCandidates(i).w, windowCandidates(i).h],'Edgecolor','g')
    pause();
end
hold off
