function Dilation = mydilategray(im,se)
% mydilatengray
    % Generate a dilated image from an imput image 
    %
    %    Parameter name      Value
    %    --------------      -----
    %    'im'                Input Image
    %    'se'               Morphological operator
    
rows = floor(size(se,1)/2);
cols = floor(size(se,2)/2);

%Pad array on all the sides
mask = padarray(im,[rows cols]);

for i = 1:size(mask,1)-(2*rows)
    for j = 1:size(mask,2)-(2*cols)
        temp = mask(i:i+(2*rows),j:j+(2*cols));
        
        for k = 1:size(se,1)
            for o = 1:size(se,2)
                if se(k,o) == 1
                else
                 temp(k,o) = 0;
                end
            end
        end
        
        a = max(max(temp(:)));
        Dilation(i,j) = a;
        
    end
end
end