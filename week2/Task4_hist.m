%http://www.codeproject.com/Articles/35895/Computer-Vision-Applications-with-C-Part-II



im1 = imread('00.001496.jpg');
im1 = rgb2hsv(im1);
%im1 = int8(im1);

%Turn the image into a vector
[rows cols comps]=size(im1);
N=rows*cols;
%im1=double(im1);

% vectorize image
X=zeros(comps,N);
for j=1:rows
    for i=1:cols
        ij=(j-1)*cols+i;
        X(1,ij)=im1(j,i,1);%H
        X(2,ij)=im1(j,i,2);%S
        %X(3,ij)=im1(j,i,3);%V
    end
end


X1 = X(1,:);
X2 = X(2,:);

% %# bin centers (integers)
% xbins = floor(min(X1)):1:ceil(max(X1));
% ybins = floor(min(X2)):1:ceil(max(X2));
% xNumBins = numel(xbins); yNumBins = numel(ybins);
% 
% %# map X/Y values to bin indices
% Xi = round( interp1(xbins, 1:xNumBins, X1, 'linear', 'extrap') );
% Yi = round( interp1(ybins, 1:yNumBins, X2, 'linear', 'extrap') );
% 
% %# limit indices to the range [1,numBins]
% Xi = max( min(Xi,xNumBins), 1);
% Yi = max( min(Yi,yNumBins), 1);
% 
% %# count number of elements in each bin
% H = accumarray([Yi(:) Xi(:)], 1, [yNumBins xNumBins]);
% 
% %# plot 2D histogram
% imagesc(xbins, ybins, H), axis on %# axis image
% colormap hot; colorbar
% hold on, plot(X1, X2, 'b.', 'MarkerSize',1), hold off












