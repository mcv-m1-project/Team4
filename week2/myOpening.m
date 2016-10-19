function [Opening] = myOpening(im,se)
% myOpening
    % Performe the operator Opening that is a combination of Erosion and
    % Dilation
    % 
    %    Parameter name      Value
    %    --------------      -----
    %    'im'               Input image
    %    'se'               Structuring element
    
    erosion = myerosiongray(im,se);
    Opening = mydilategray(erosion,se);

end