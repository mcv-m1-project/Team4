close all
clear all
clc

im = imread('mejora/A/mask.01.001796.HSV.png'); % read the image
im_width = size(im,2);
im_height = size(im,1);

w_width = 86;
w_height = 86;

window = zeros(w_height,w_width);
window_area = w_height*w_width;
w_signal = {};
d = 1;
for i = 1:(im_height - w_height)
    for j = 1:(im_width - w_width)
        window = im(i:i + (w_height - 1), j:j + (w_width - 1));
        signal_area = sum(sum(window));
        %bbox_area = boundingboxes(k,3).*(boundingboxes(k,4));
        fr = signal_area / window_area;
        if (fr > 0.4 && fr < 0.6) || (fr > 0.7 && fr < 0.85) || (fr > 0.9 && fr <= 1)
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
  

