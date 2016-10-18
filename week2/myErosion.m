function [ImEroted] = myErosion(I,se)
% MyErosion
    % Generate a esosioned image from an imput image 
    %
    %    Parameter name      Value
    %    --------------      -----
    %    'I'           Input Image
    %    'se'          Morphological operator 
   
[row,col]=size(I);
ImEroded = zeros(row,col);
[xse,yse] = size(se);

TopWeight = floor(xse/2);
TopHight = floor(yse/2);

Ipad = padarray(I,[TopHight TopWeight],'replicate'); %We will create an image that the operator fit in the image and It can work. We extend the matrix using a mirror

 for y = 1:col+TopHight % numberof rows in image
                for x = 1:row+TopWeight % number of columns in the image
                
                Temp = 
                ImEroded(y,x) = min(Impad([],[]))
                end 
 end
end