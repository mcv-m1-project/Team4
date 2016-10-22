function HistogramBackProjection = HistogramBackProjection(struct,dirname1,nbins,dirname_new,Histogram)

dirnamecreate= ['test/Masks/' dirname_new];
[s, mess, messid] = mkdir(dirnamecreate);

for i = 1:length(struct)

toSplit = strsplit(struct{i}.name,{'gt.','.txt'});
im = imread(fullfile(dirname1, strjoin([toSplit(2) '.jpg'],'')));

im_hsv = rgb2hsv(im);
H = im_hsv(:,:,1);
S = im_hsv(:,:,2);
V = im_hsv(:,:,3);

mask=size(im);

for i = 1:size(H,1)
   for j = 1:size(H,2)
   X=round(H(i,j)*(nbins(1)-1)+1);
   Y=round(S(i,j)*(nbins(2)-1)+1);
   Prob=Histogram(X,Y);
   if Prob>=0.001
       mask(i,j)=1;
   else
       mask(i,j)=0;
   end
   end
end

imwrite(mask, strjoin([dirnamecreate '/' toSplit(2) '_' dirname_new '.png'],''));

end
end

   
