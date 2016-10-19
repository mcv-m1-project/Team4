function Opening = myOpening(im,se)
% myOpening
    % Performe the operator Opening that is a combination of Erosion and
    % Dilation
    % 
    %    Parameter name      Value
    %    --------------      -----
    %    'im'               Input image
    %    'se'               Structuring element
    
    Erosion = myerosiongray(im,se);
    Opening = mydilategray(Erosion,se);

end