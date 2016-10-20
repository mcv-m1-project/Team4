function Mejora = Mejora (struct, dirname, dirname_new)

for i=1:length(struct)
    
Im1 = imread(fullfile([dirname],struct(i).name));
toSplit = strsplit(struct(i).name,{'.png'});

%figure(1)
%imshow(Im1);

se1 = ones(5,5);
se2 = ones(8,8);
% Im1 = imfill(Image_mask);
% figure(2)
% imshow(Im1);

Im2 = imdilate(Im1,se1);
%figure(2)
%imshow(Im2);

Im3 = imfill(Im2,'holes');
%figure(3)
%imshow(Im3);

Im4 = imopen(Im3,se2);
%figure(4)
%imshow(Im4);

imwrite(Im4, strjoin([dirname_new '/' toSplit(1) '.png'],''));

end
% Im3 = imtophat(Im2,se);
% figure(2)
% imshow(Im3);

% Im4 = imbothat(Im2,se);
% figure(3)
% imshow(Im4);