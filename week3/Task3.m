im = imread('mejora/A/mask.01.001796.HSV.png'); % read the image
im_width = size(im,2);
im_height = size(im,1);

w_width = 32;
w_height = 32;

window = zeros(w_height,w_width);

%inte = integralImage(im);
inte2=cumsum(cumsum(double(im)),2);

for i = 1:(im_height - w_height)
    for j = 1:(im_width - w_width)
        window = im(i:i + (w_height - 1), j:j + (w_width - 1));
        
        %regionSum = inte(i+w+h,j+w-h+1) + inte(i,j+1) - inte(i+h,j-h+1) - inte(i+w,j+w+1);
        regionSum= inte2(i+w_heigth-1,j+w_width-1)+inte2(i,j)-inte2(i,j+w_width-1)-inte2(i+w_height-1,j);

      fr = regionSum / window_area;
        if (fr > 0.45 && fr < 0.55) || (fr > 0.72 && fr < 0.82) || (fr > 0.9 && fr <= 1)
            w_signal{d} = window;
            w_position(d,:) = [j,i,w_height,w_width];
            d = d + 1;
        end
    end
end


% afegir mitjana de bbox dels txt

imshow(im); %Plot the image and the boxes
hold on
for k = 1:size(w_position,1)
    rectangle('position',w_position(k,:),'Edgecolor','g')
end

% prova amb una imatge
imshow(im); %Plot the image and the boxes
hold on
rectangle('position',w_position(75,:),'Edgecolor','g') 
              
