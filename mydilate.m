function [dilation] = mydilate(im,se)

% mask = [zeros(size(z,1),1) mask zeros(size(z,1),1)];
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

imshow(dilation);

% for i = 1:size(se,1):size(mask,1)
%     for j = 1:size(se,2):size(mask,2)
%         dilation(i:i+(size(se,1)-1),j:j+(size(se,2)-1)) = and(mask(i:i+(size(se,1)-1),j:j+(size(se,2)-1)),se);
%         if mask(i,j) == 0
%             z(i+(size(se,1)-1),j+(size(se,2)-1)) = 0;
%         end     
%     end
% end

end

A=im2bw(A);
%Structuring element
B2=getnhood(strel('line',7,90));
m=floor(size(B2,1)/2);
n=floor(size(B2,2)/2);
%Pad array on all the sides
C=padarray(A,[m n]);
D=false(size(mask));
for i=1:size(C,1)-(2*m)
    for j=1:size(C,2)-(2*n)
        Temp=C(i:i+(2*m),j:j+(2*n));
        D(i,j)=max(max(Temp&B2));
    end
end
