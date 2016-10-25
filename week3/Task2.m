im = imread('mejora/A/mask.01.001796.HSV.png'); % read the image
im_width = size(im,2);
im_height = size(im,1);

w_width = 32;
w_height = 32;

window = true(im_height,im_width);

for i = 1:(im_height - w_height)
    for j = 1:(im_width - w_width)
        window(i:i + (w_height - 1),j:j + (w_width - 1)) = im(i:i + (w_height - 1), j:j + (w_width - 1));
            if sum(window) >  
                
                
            end
    end
end

imshow(im);

imshow(window);