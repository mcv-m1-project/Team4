function [dilation] = mydilate(im,se)

rows = floor(size(se,1)/2);
cols = floor(size(se,2)/2);

%Pad array on all the sides
mask = padarray(im,[rows cols]);

dilation = false(size(im));

for i=1:size(mask,1)-(2*rows)
    for j=1:size(mask,2)-(2*cols)
        temp = mask(i:i+(2*rows),j:j+(2*cols));
        dilation(i,j)=max(max(temp&se));
    end
end
end

% for i = 1:size(se,1):size(mask,1)
%     for j = 1:size(se,2):size(mask,2)
%         dilation(i:i+(size(se,1)-1),j:j+(size(se,2)-1)) = and(mask(i:i+(size(se,1)-1),j:j+(size(se,2)-1)),se);
%         if mask(i,j) == 0
%             z(i+(size(se,1)-1),j+(size(se,2)-1)) = 0;
%         end     
%     end
% end
