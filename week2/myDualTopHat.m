function DualTopHat = myDualTopHat(im,se)
% myDualTopHat
    % Performe the operator Dual Top Hat that applies the operator Closing
    % and then calculates the difference respect the image
    % 
    %    Parameter name      Value
    %    --------------      -----
    %    'im'               Input image
    %    'se'               Structuring element

    Closing = myClosing(im,se);
    DualTopHat = Closing - im;
    
end
