
function SquareTriangle = HoughSquareTriangle(mask, windowCandidate)

SquareTriangle = 0;

% Compute standard hough transform
[H, ~, ~] = hough(mask);
%[H, THETA, RHO] = hough(mask);
% imshow(H, [], 'XData', THETA, 'YData', RHO, 'InitialMagnification', 'fit');
% xlabel('\theta'), ylabel('\rho');
% axis on, axis normal, hold on;

nmax = max(max(H));
data = zeros(1, nmax);
for i = 1:nmax
    data(i) = sum(sum(H == i));
end

[maxval,maxind] = max(data);
medval = median(data);
[p] = polyfit(1:maxind-5,data(1:maxind-5),2);

if maxval<3*medval
    %disp('Found triangle');
    SquareTriangle = 1;
end
valor=windowCandidate.w - 80;
if  (p(3) > valor)
    %disp('Found square');
    SquareTriangle = 1;
end
end