function Closing = myClosing(im,se)
% myClosing
    % Performe the operator Closing that is a combination of Dilation and
    % Erosion
    % 
    %    Parameter name      Value
    %    --------------      -----
    %    'im'               Input image
    %    'se'               Structuring element
    
    Dilation = mydilategray(im,se);
    Closing = myerosiongray(Dilation,se);
    
end
