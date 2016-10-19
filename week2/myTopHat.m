function TopHat = myTopHat(im,se)
% myTopHat
    % Performe the operator Top Hat that applies Opening and then calculates
    % the difference respect the image
    % 
    %    Parameter name      Value
    %    --------------      -----
    %    'im'               Input image
    %    'se'               Structuring element
    
    Opening = myOpening(im,se);
    TopHat = im - Opening;
    
end