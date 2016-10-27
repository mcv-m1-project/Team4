im = imread('mejora/A/mask.01.001796.HSV.png'); % read the image
im_width = size(im,2);
im_height = size(im,1);

w_width = 32;
w_height = 32;

window = zeros(w_height,w_width);

%inte = integralImage(im);
inte2=cumsum(cumsum(double(im)),2);                 %Transparencias clase de como realizar integral

for i = 1:(im_height - w_height)
    for j = 1:(im_width - w_width)
        window = im(i:i + (w_height - 1), j:j + (w_width - 1));
        
        %regionSum = inte(i+w+h,j+w-h+1) + inte(i,j+1) - inte(i+h,j-h+1) - inte(i+w,j+w+1);
        regionSum= inte2(i+w_heigth-1,j+w_width-1)+inte2(i,j)-inte2(i,j+w_width-1)-inte2(i+w_height-1,j);   
        %http://es.mathworks.com/help/images/ref/integralimage.html
%         ratio = 1;
%         
%         if sum(window) >  
%                 
%                 
%             end
    end
end


CCboxes = struct( 'x', boundingboxes(:,1), ... 
               'y', boundingboxes(:,2), ... 
               'width', boundingboxes(:,3), ... 
               'height', boundingboxes(:,4) );  
              
