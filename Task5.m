% Normalizing RGB image
% https://es.mathworks.com/matlabcentral/newsreader/view_thread/171190
% Converting an RGB image into normalized RGB removes the effect of any intensity variations.

Image_rgb = imread('00.005872.jpg');
Image_rgb = double(Image_rgb);
figure;imshow(uint8(Image_rgb));

Image_red = Image_rgb(:,:,1); %We separate the 3 color channels
Image_green = Image_rgb(:,:,2);
Image_blue = Image_rgb(:,:,3);


[row,col] = size(Image_rgb(:,:,1));

for y = 1:row %-->numberof rows in image
   for x = 1:col %-->number of columns in the image
      Red = Image_red(y,x); %Value of every pixel
      Green = Image_green(y,x);
      Blue = Image_blue(y,x);

    NormalizedRed = Red/sqrt(Red^2 + Green^2 + Blue^2); %Normalize
    NormalizedGreen = Green/sqrt(Red^2 + Green^2 + Blue^2);
    NormalizedBlue = Blue/sqrt(Red^2 + Green^2 + Blue^2);

    Image_red(y,x) = NormalizedRed;
    Image_green(y,x) = NormalizedGreen;
    Image_blue(y,x) = NormalizedBlue;
   end
end

Image_rgb(:,:,1) = Image_red;
Image_rgb(:,:,2) = Image_green;
Image_rgb(:,:,3) = Image_blue;

figure(2)
imshow(Image_rgb);
%Image_rgb = Image_rgb .* Image_rgb;
%Image_rgb = Image_rgb .* Image_rgb;

%Segmentation part

im_R = Image_red; % channel red
im_G = Image_green; % channel green
im_B = Image_blue; % channel blue

            % Otsu's Method: 
thresh_R = multithresh(im_R,3); %
thresh_G = multithresh(im_G,3); 
thresh_B = multithresh(im_B,3); 

            % RGB space
red1 = (im_R > thresh_R(3)) & (im_B < thresh_B(2)) & (im_G < thresh_G(2)); % red mask
blue1 = (im_R < thresh_R(2)) & (im_B > thresh_B(3)) & (im_G < thresh_G(2)); % blue mask          
            
            
% red1 = (im_R > 0.7) & (im_B < 0.55) & (im_G < 0.55); % red mask
% blue1 = (im_R < 0.55) & (im_B > 0.7) & (im_G < 0.55); % blue mask

mask_rgb = red1 | blue1; 

figure(3)
imshow(mask_rgb);

