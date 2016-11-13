    clear all;
    clc;
    
    
    [final, maskFiles] = ReadMat();
    dirname='Masks&Mat/Method CC and correlation';
    matFiles = dir(fullfile(dirname,'*.mat')); % Get all .mat files
    mkdir('Hough Test');
    dirnamemask='Hough Test';
    
    dirnameimg='Test Images';
    ImageFiles= ReadImage();
    %Final values for maximum angle deviation of quare and triangle signal
    %lines
    delta_theta_90 = 4;
    delta_theta_30 = 8;
    delta_theta_0 = 19;
    grdthres = 1.5;
    fltr4LM_R = 23;
    
    % Parameters for Canny edge detector:
    threshold_canny = [0.05, 0.2];
    sigma = 1;

    for i = 1:length(final)
        %Cargamos las windows Candidates y las imágenes
        file=fullfile(dirname,final{i});
        Allwindows=load(file); %carrega de windowsCandidate
        fileim=fullfile(dirname,maskFiles(i).name);
        im=imread(fileim);
        
        fileimage=fullfile(dirnameimg,ImageFiles(i).name);
        image=imread(fileimage);
        
        for j=1:length(Allwindows.windowCandidates)
            window=Allwindows.windowCandidates(j);
            %im_windowed= paintMask (image, window); %Realizamos Hough para cada windowsCandidate independientemente
            im_windowed=image;
                     if((window.h >= 32) && (window.w >= 32))
                     
                     im_windowed = image(window.y:window.y+window.h-1, window.x:window.x+window.w-1, :);
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
                     
                     if window.y ~= 0 && window.x~= 0
                         if (size(im,2) - window.x-window.w)<5 && (size(im,2) - window.x-window.w)>1
                        mask_windowed = im(window.y-1:window.y+window.h+1, window.x-1:window.x+window.w+1, :); 
                         elseif (size(im,2) - window.x-window.w)>19 && window.x> 20 && window.y >20
                        mask_windowed = im(window.y-20:window.y+window.h+20, window.x-20:window.x+window.w+20, :);
                         elseif (size(im,2) - window.x-window.w)>19 && (window.x< 20 || window.y <20)
                          mask_windowed = im(window.y:window.y+window.h, window.x:window.x+window.w, :);   
                         elseif (size(im,2) - window.x-window.w)<1
                          mask_windowed = im(window.y:window.y+window.h, window.x:window.x+window.w, :);   
                         else
                        mask_windowed = im(window.y-5:window.y+window.h+5, window.x-5:window.x+window.w+5, :);
                         end
                    
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
                                      figure(1), subplot(2,2,4), imshow(mask_windowed), hold on
                                      max_len = 0;
                                     for k = 1:length(lines)
                                          xy = [lines(k).point1; lines(k).point2];
                                          plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
                     
                                          % Plot beginnings and ends of lines
                                          plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
                                         plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
                     
                                          % Determine the endpoints of the longest line segment
                                          len = norm(lines(k).point1 - lines(k).point2);
                                          if ( len > max_len)
                                              max_len = len;
                                              xy_long = xy;
                                         end
                                      end
                                      % highlight the longest line segment
                                      plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','red');
                                      hold off
                     
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
                     
                    horizontal=[];
                    vertical=[];
                    triangle=[];
                    
                    %eliminar lineas horizontales que se parecen
                    r=2; 
                    for k=1:size(hor_line,1)-1
                        horizontal(1,:)=hor_line(1,:);

                        diffhorizontal= abs( hor_line(k,3) - hor_line(k+1,1));
                        difflinia= abs( hor_line(k,2)-hor_line(k+1,2));
                        if diffhorizontal<8 && difflinia<6
                        else
                            horizontal(r,:)=hor_line(k,:);
                            r=r+1;
                        end
                    end
                    
                    %eliminar lineas verticales que se parecen
                    r=2;
                    for k=1:size(vert_line,1)-1
                        vertical(1,:)=vert_line(1,:);
                        
                        difflinia=abs( vert_line(k,1)-vert_line(k+1,1));
                        if difflinia <6
                        else
                         vertical(r,:)=vert_line(k,:);
                         r=r+1;
                        end    
                    end
                    
                    %eliminar lineas triangulares que se parecen
                    r=2;
                    for k=1:size(triang_line,1)-1
                        triangle(1,:)=triang_line(1,:);

                        diff= abs(triang_line(k,3)-triang_line(k+1,1));
                        if diff<6
                        else
                            triangle(r,:)=triang_line(k,:);
                            r=r+1;
                        end
                    end
                
                    %detectar cuadrados
                    for k=1:size(vertical,1)
                        for o=1:size(horizontal,1)
                            if (horizontal(o,1)-vertical(k,1))<10 || (horizontal(o,3)-vertical(k,1))<10 || (horizontal(o,1)-vertical(k,3))<6 || (horizontal(o,3)-vertical(k,3))<6
                                square_detected=true;
                            else
                            end
                        end
                    end
                    
                    %detectar triangulos
                    if size(triangle,1) ~=0
                        triangle_detected=true;
                    end
                     end
        
        end
        k=1;
        if window.x==0 && window.y==0
        windowCandidatesReal(k) = window;
        k=k+1;
        square_detected=false;
        triangle_detected=false;
        circle_detected=false;
        end
        k=1;
        if square_detected==true || triangle_detected ==true || circle_detected == true
            windowCandidatesReal(k)=window;
            k=k+1;
        else
            windowCandidatesReal(k).x=0;
            windowCandidatesReal(k).y=0;
            windowCandidatesReal(k).w=0;
            windowCandidatesReal(k).h=0;
            k=k+1;
        end
        k=1;
        if window.x==0 && window.y==0
            windowCandidatesReal(k) = window;
            k=k+1;
        end
        
        end
       
       
       for k=1:length(windowCandidatesReal)
       windowCandidates(k)=windowCandidatesReal(k);
       end
       
       if windowCandidates(1).x==0 && windowCandidates(1).y==0
           
       [pathstr_r,name_r,ext_r]=fileparts(maskFiles(i).name);
       im(:,:)=0;
       Mask= im;
       imwrite(Mask, fullfile(dirnamemask,[name_r '.png']));
       save([dirnamemask,'/',name_r,'.mat'],'windowCandidates');
       else
       [pathstr_r,name_r,ext_r]=fileparts(maskFiles(i).name);
       Mask= paintMask (im, windowCandidates);
       imwrite(Mask, fullfile(dirnamemask,[name_r '.png']));
       save([dirnamemask,'/',name_r,'.mat'],'windowCandidates'); 
       end
       
       clear window
       clear windowCandidates
       clear windowCandidatesReal;
        
    end
    
    
