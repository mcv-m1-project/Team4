function [Opening] = myOpening(im,se)
% myOpening
    % Performe the operator Opening that is a combination of Erosion and
    % Dilation
    % 
    %    Parameter name      Value
    %    --------------      -----
    %    'im'               Input image
    %    'se'               Structuring element
    
    imEroded = myErosion(im,se);
    Opening = mydilategray(imEroded,se);

end
