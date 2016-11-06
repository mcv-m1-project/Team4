
function [circleedge] = CreateCircles(rad)
width = rad*2;
height = rad*2;
radius = rad;
centerW = width/2;
centerH = height/2;
[W,H] = meshgrid(1:width,1:height);
kl = ((W-centerW).^2 + (H-centerH).^2) < radius^2;
circleedge = edge(kl,'Canny');
%imshow(Circ);
end