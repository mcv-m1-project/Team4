function [Closing] = myClosing(im,se)
% myClosing
    % Performe the operator Closing that is a combination of Dilation and
    % Erosion
    % 
    %    Parameter name      Value
    %    --------------      -----
    %    'im'               Input image
    %    'se'               Structuring element
    
    dilation = mydilategray(im,se);
    Closing = myErosion(dilation,se);
    
end
