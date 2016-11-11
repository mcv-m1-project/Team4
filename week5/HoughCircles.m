function Circles = HoughCircles(mask, windowCandidates)

Circles = 0;
% Define 5-by-5 filter to smooth out the small scale irregularities
fltr4img = [1 1 1 1 1; 1 2 2 2 1; 1 2 4 2 1; 1 2 2 2 1; 1 1 1 1 1];
fltr4img = fltr4img / sum(fltr4img(:));
imgfltrd = filter2( fltr4img , mask );
mask=imgfltrd;


center_x = windowCandidates.x+(windowCandidates.w/2);
center_y = windowCandidates.y+(windowCandidates.h/2);
centercircle = [center_x center_y];

%Radius
Rad = floor(windowCandidates.w/2);
Rmin = Rad - 10;
Rmax = Rad + 10;
Range = [Rmin Rmax];

% Define inputs to function CircularHough_Grd.
% Based on example #3 provided on file CircularHough_Grd.m
fltr4LM_R = 8;
multirad = 10;
fltr4accum = 0.7;

% Compute circular hough
[~, Circular, ~] = CircularHough_Grd(mask, Range, 8, 10 , 0.7);

% Check if exists any location that match with center of window candidate.
% In this case, it means that within of window candidate there is one circle.
[n, ~] = size(Circular);
for zz=1:n
    locations = [centercircle(1), centercircle(2); Circular(zz,1),Circular(zz,2)];
    dist = pdist(locations, 'euclidean');  
    if dist <= 1 
        %message = sprintf('Found circle. Distance: %d', dist);
        %disp(message);
        Circles = 1;
    end     
end
end