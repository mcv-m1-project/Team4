im = imread('/Users/Toni/Desktop/Toni/Master/ProjectMaterials/Week 1/Code/train/00.002300.jpg');

thresh1 = multithresh(im(:,:,1));
thresh11 = multithresh(im(:,:,1),2);
thresh2 = multithresh(im(:,:,2));
thresh22 = multithresh(im(:,:,2),2);
thresh3 = multithresh(im(:,:,3));
thresh33 = multithresh(im(:,:,3),2); 

red = (im(:,:,1) > thresh1) & (im(:,:,2) < thresh2) & (im(:,:,3) < thresh3);
green = im(:,:,1) < thresh1 & im(:,:,2) > thresh2 & im(:,:,3) < thresh3;
blue = im(:,:,1) < thresh1 & im(:,:,2) < thresh2 & im(:,:,3) > thresh3;

red1 = (im(:,:,1) > thresh11(1)) & (im(:,:,2) < thresh22(1)) & (im(:,:,3) < thresh33(1));
green1 = (im(:,:,1) < thresh11(1)) & (im(:,:,2) > thresh22(1)) & (im(:,:,3) < thresh33(1));
blue1 = (im(:,:,1) < thresh11(1)) & (im(:,:,2) < thresh22(1)) & (im(:,:,3) > thresh33(1));

figure(1)
imshow(im)
figure(2)
subplot(1,2,1)
imshow(blue|red);
subplot(1,2,2)
imshow(blue1|red1);

% 
% qu = imquantize(im,thresh11);
% RGB = label2rgb(qu);
% 
% imshow(im);