function = HistogramBackProjection(struct,dirname_new)

dirname = ['test/' dirname_new];

for i = 1:length(struct)

toSplit = strsplit(struct{i}.name,{'gt.','.txt'});
im = imread(fullfile(dirname, strjoin([toSplit(2) '.jpg'],'')));

im_hsv = rgb2hsv(im);
H = im_hsv(:,:,1);
S = im_hsv(:,:,2);
V = im_hsv(:,:,3);

for nbins = 1:length(nbins)
for i = 1:size(H,1)
   for j = 1:length(H,2)
   
   end
   
end


    
    
end