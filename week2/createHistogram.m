function Histogram2D = createHistogram(struct,dirname,dirname_s,nbins)

Histogram2D = zeros(nbins);

dirname_new = ['test/' dirname_s];
[s, mess, messid] = mkdir(dirname_new);

for i = 1:length(struct)
    
toSplit = strsplit(struct{i}.name,{'gt.','.txt'});
im = imread(fullfile(dirname, strjoin([toSplit(2) '.jpg'],'')));

imwrite(im,strjoin([dirname_new '/' toSplit(2) '.jpg'],''));

im_hsv = rgb2hsv(im);
H = im_hsv(:,:,1);
S = im_hsv(:,:,2);
V = im_hsv(:,:,3);

x = round(struct{i}.tly):round(struct{i}.bry);
y = round(struct{i}.tlx):round(struct{i}.brx);

H = H(x,y);
S = S(x,y);

H = H(:);
S = S(:);

Histogram2D = Histogram2D + hist3([H,S],nbins);


end

Histogram2D = Histogram2D/sum(sum(Histogram2D));

end