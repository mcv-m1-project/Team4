function HistogramBackProjection = HistogramBackProjection(struct,dirname1,nbins,dirname_new,Histogram)

dirnamecreate= ['test/Masks/' dirname_new];
[s, mess, messid] = mkdir(dirnamecreate);

SE = strel('disk',5);
disk = double(SE.getnhood());
threshold=0.001;

for i = 1:length(struct)

toSplit = strsplit(struct{i}.name,{'gt.','.txt'});
im = imread(fullfile(dirname1, strjoin([toSplit(2) '.jpg'],'')));

im_hsv = rgb2hsv(im);
H = im_hsv(:,:,1);
S = im_hsv(:,:,2);
V = im_hsv(:,:,3);

I = hist3([H(:),S(:)],nbins);%histogram of full image to create the ratio

Ratio = Histogram./I; %Ratio between de hist of the target and hist of the image

Back = zeros(size(H));%Histogram Backprojection

mask=zeros(size(im));

for i = 1:size(H,1)
   for j = 1:size(H,2)
   X=round(H(i,j)*(nbins(1)-1)+1);
   Y=round(S(i,j)*(nbins(2)-1)+1);
   
    Back(i,j)=Ratio(X,Y);
%    Prob=Histogram(X,Y);
%    if Prob>=0.0085
%        mask(i,j)=1;
%    else
%        mask(i,j)=0;
%    end
   end
end

Back=min(Back,1);
Back = conv2(Back,disk,'same');
Back=Back/max(max(Back));
mask=Back>threshold;


imwrite(mask, strjoin([dirnamecreate '/' toSplit(2) '_' dirname_new '.png'],''));

end
end