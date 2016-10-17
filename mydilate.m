function [mask2] = mydilate(mask,se)

mask2 = zeros(size(mask,1),size(mask,2));

z = zeros(6,6);

mask = [zeros(size(z,1),1) mask zeros(size(z,1),1)];

for i = 1:size(se,1):size(mask,1)
    for j = 1:size(se,2):size(mask,2)
        mask2(i:i+(size(se,1)-1),j:j+(size(se,2)-1)) = and(mask(i:i+(size(se,1)-1),j:j+(size(se,2)-1)),se);
        if mask(i,j) == 0
            z(i+(size(se,1)-1),j+(size(se,2)-1)) = 0;
        end     
    end
end

end