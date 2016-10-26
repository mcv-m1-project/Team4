clear all
im = imread('mask.01.001796.HSV.png');
CC = bwconncomp(im);
nobj = CC.NumObjects;
stats = regionprops(CC,'BoundingBox');
fA = regionprops(CC,'FilledArea');

boundingboxes = cat(1,stats.BoundingBox);

%Filtering part

%We will filter the small objects, the big objecta and the objects with
%incorrect filling ratio and aspect ratio
%filling ratio in triangles = 1/2
%filling ratio in circle = pi/4
%Correct form factor = 1:1 
d = 1;
for k = 1:size(boundingboxes,1)
    ratio(k) = boundingboxes(k,3) ./ boundingboxes(k,4);
    bbarea = boundingboxes(k,3) .* boundingboxes(k,4);
    fratio = fA(k).FilledArea / bbarea;
%     if((boundingboxes(k,3)<30)||(boundingboxes(k,4)<30)||(ratio(k)<0.9)||(ratio(k)>1.1))
    if((fratio>0.45)||(fratio<1.1)||(ratio(k)<0.9)||(ratio(k)>1.1))
    delete(d) = k;
    d = d+1;
    end
    
    fr(k) = fratio;
end

boundingboxes(delete,:)=[]; %We eliminate the objects that can't be a signal 
fr(:,delete)=[];

imshow(im); %Plot the image and the boxes
hold on
for k = 1:size(boundingboxes,1)
    rectangle('position',boundingboxes(k,:),'Edgecolor','g')
end
hold off


CCboxes = struct( 'x', boundingboxes(:,1), ... 
               'y', boundingboxes(:,2), ... 
               'width', boundingboxes(:,3), ... 
               'height', boundingboxes(:,4) );  
              
