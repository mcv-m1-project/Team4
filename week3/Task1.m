clear all
close all
clc

dirname = 'mejora';
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
        % if((boundingboxes(k,3)<30)||(boundingboxes(k,4)<30)||(ratio(k)<0.9)||(ratio(k)>1.1))
        % if((fr(k) > 0.45) && (fr(k) < 1.1) || (ratio(k) < 0.9) || (ratio(k) > 1.1))
        if ((fr(k) > 0.4 && fr(k) < 0.6) || (fr(k) > 0.7 && fr(k) < 0.85) || (fr(k) > 0.9 && fr(k) <= 1)) && ((boundingboxes(k,3) > 30) || (boundingboxes(k,4) > 30)) && ((ratio(k) > 0.8) && (ratio(k) < 1.2))
        else    
            delete(d) = k;
            d = d + 1;
        end
    end
    
    if(delete~=0)
        boundingboxes(delete,:) = []; %We eliminate the objects that can't be a signal 
        fr(delete,:) = [];
    end
    
    if(~isempty(boundingboxes))
        CCboxes(i,:) = struct('x', boundingboxes(:,1), ... 
               'y', boundingboxes(:,2), ... 
               'w', boundingboxes(:,3), ... 
               'h', boundingboxes(:,4));
    else
        CCboxes(i,:) = struct( 'x', 0, ... 
               'y', 0, ... 
               'w', 0, ... 
               'h', 0);
    end
    
%     if size(boundingboxes,1) > 1
%         ListOfBbox(i,:) = boundingboxes(:)';
%     else  
%         ListOfBbox(i,:) = boundingboxes;
%     end

% imshow(im)
% hold on
% for j = 1:length(CCboxes(i).x)
% rectangle('position',[CCboxes(i).x(j), CCboxes(i).y(j), CCboxes(i).width(j), CCboxes(i).height(j)],'Edgecolor','g')
% end
% pause();
end

timeTask1 = toc;

%% Result: List Of Bounding Boxes containing a detection

% save as .mat file
save CCboxes 

%% 

imshow(im); %Plot the image and the boxes
hold on
for k = 1:size(CCboxes,2)
    rectangle('position',CCboxes(k,:),'Edgecolor','g')
end
hold off

% CCboxes = struct( 'x', boundingboxes(:,1), ... 
%                'y', boundingboxes(:,2), ... 
%                'width', boundingboxes(:,3), ... 
%                'height', boundingboxes(:,4) ); 
 
%% 

imshow(im); %Plot the image and the boxes
hold on
rectangle('position',[CCboxes(2).x, CCboxes(2).y, CCboxes(2).width, CCboxes(2).height],'Edgecolor','g')
