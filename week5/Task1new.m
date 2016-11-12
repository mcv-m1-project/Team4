    clear all;
    clc;
    
    
    [final, maskFiles] = ReadMat();
    dirname='Masks&Mat/Validation Train';
    matFiles = dir(fullfile(dirname,'*.mat')); % Get all .mat files
    mkdir('Hough');
    dirnamemask='Hough';

    for i = 1:length(final)
        %Cargamos las windows Candidates y las imágenes
        file=fullfile(dirname,final{i});
        windows=load(file); %carrega de windowsCandidate
        fileim=fullfile(dirname,maskFiles(i).name);
        im=imread(fileim);
        for j=1:length(windows.windowCandidates)
        im_windowed= paintMask (im, windows.windowCandidates(j)); %Realizamos Hough para cada windowsCandidate independientemente
        
                     if((window.h >= 32) && (window.w >= 32))
                     
                     im_windowed = im(window.y:window.y+window.h-1, window.x:window.x+window.w-1, :);
                     im_windowed = imresize(im_windowed, [max(window.w,window.h), max(window.w,window.h)]);
                     im_windowed_gray = rgb2gray(im_windowed);
                     
                     minrad = round(min(size(im_windowed,1), size(im_windowed,2)) / 3);
                     maxrad = round(min(size(im_windowed,1), size(im_windowed,2)) / 2 * 1.2);
                     
                     circle_detected = false;
                     triangle_detected = false;
                     square_detected = false;
                     % Compute the Hough Transform searching for circles:
                     % It is important to note that we are feeding this function
                     % with the greyscale image, not the edges one. This means the
                     % edges we are finding may not be the ones actually used inside
                     % the function.
                     [~, ~, cirrad] = CircularHough_Grd(im_windowed_gray, ...
                         [minrad, maxrad], grdthres, fltr4LM_R);
                     if(~isempty(cirrad))
                         circle_detected = true;
                     else
                         circle_detected = false;
                     end
                 else
                     circle_detected = false;
                     end
                 
                     
                     
                     if(circle_detected == false)
                     % Compute mask edges with Canny:
                     mask_edges = edge(mask_windowed, 'canny', threshold_canny, sigma);
                     
                     
                     %                 figure(1)
                     %                 subplot(2,2,1), imshow(im_windowed_gray)
                     %                 subplot(2,2,2), imshow(mask_windowed, [0,1])
                     %                 subplot(2,2,3), imshow(mask_edges)
                     
                     %Compute the Hough Transform of the edges binary image
                     [H,theta,rho] = hough(mask_edges);
                     
                     %                 figure(2)
                     %                 imshow(imadjust(mat2gray(H)),'XData',theta,'YData',rho,...
                     %                     'InitialMagnification','fit'), hold on
                     %                 title('Hough transform of gantrycrane.png');
                     %                 xlabel('\theta'), ylabel('\rho');
                     %                 axis on, axis normal, hold on;
                     %                 colormap(gca,hot);
                     
                     %Find peaks in Hough Transform
                     P = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
                     
                     %Superimpose a plot on the image of the transform that identifies the peaks
                     %                 x = theta(P(:,2));
                     %                 y = rho(P(:,1));
                     %                 figure(2)
                     %                 plot(x,y,'s','color','black');
                     %                 hold off
                     
                     %Find lines in the image using the houghlines function.
                     lines = houghlines(mask_edges,theta,rho,P,'FillGap',5,'MinLength',7);
                     
                     %Create a plot that displays the original image with the lines superimposed on it.
                     %                 figure(1), subplot(2,2,4), imshow(im_windowed_gray), hold on
                     %                 max_len = 0;
                     %                 for k = 1:length(lines)
                     %                     xy = [lines(k).point1; lines(k).point2];
                     %                     plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
                     %
                     %                     % Plot beginnings and ends of lines
                     %                     plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
                     %                     plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
                     %
                     %                     % Determine the endpoints of the longest line segment
                     %                     len = norm(lines(k).point1 - lines(k).point2);
                     %                     if ( len > max_len)
                     %                         max_len = len;
                     %                         xy_long = xy;
                     %                     end
                     %                 end
                     %                 % highlight the longest line segment
                     %                 plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','red');
                     %                 hold off
                     
                     %Create three arrays to store the horizontal, vertical and
                     %triangle (30 degrees) lines
                     hor_line = [];
                     vert_line = [];
                     triang_line = [];
                     for k = 1:length(lines)
                         xy = [lines(k).point1; lines(k).point2];
                         if((abs(lines(k).theta) >= 90 - delta_theta_90) && (abs(lines(k).theta) <= 90 + delta_theta_90))
                             %Horizontal line detected
                             hor_line = [hor_line; [lines(k).point1 lines(k).point2]];
                         elseif((abs(lines(k).theta) >= 0 - delta_theta_0) && (abs(lines(k).theta) <= 0 + delta_theta_0))
                             %Vertical line detected
                             vert_line = [vert_line; [lines(k).point1, lines(k).point2]];
                         elseif((abs(lines(k).theta) >= 30 - delta_theta_30) && (abs(lines(k).theta) <= 30 + delta_theta_30))
                             %30 degrees detected
                             triang_line = [triang_line; [lines(k).point1, lines(k).point2, lines(k).theta]];
                         end
                     end
                     
        end
        
    end