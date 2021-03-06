function [ImEroded] = myErosion(im,se)
% MyErosion
    % Generate a esosioned image from an imput image 
    %
    %    Parameter name      Value
    %    --------------      -----
    %    'im'               Input Image
    %    'se'          Morphological operator 
   
[row,col]=size(im);
ImEroded = zeros(row,col);
[xse,yse] = size(se);

TopWidth = floor(xse/2);
TopHeight = floor(yse/2);

Ipad = padarray(im,[TopHeight TopWidth],'replicate'); % We will create an image that the operator fit in the image and It can work. We extend the matrix using a mirror

for y = 1:col % number of rows in image
    for x = 1:row % number of columns in the image  
        Temp = Ipad(x:x+(2*TopWidth), y:y+(2*TopHeight));
        ImEroded(x,y) = min(min(se&Temp));
    end 
end
end