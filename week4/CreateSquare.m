function [squareedge] = CreateSquare(lad)
kl = zeros(lad);
kl(4:lad-4,4:lad-4) = 1;
squareedge = edge(kl,'Canny');
end