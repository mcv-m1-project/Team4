    clear all;
    clc;
    
    [final, maskFiles] = ReadMat();
    dirname='Masks&Mat/Validation Train';
    matFiles = dir(fullfile(dirname,'*.mat')); % Get all .mat files
    mkdir('Hough');
    dirnamemask='Hough';
    
    for i = 2:length(final)
        %Cargamos las windows Candidates y las imágenes
        file=fullfile(dirname,final{i});
        windows=load(file); %carrega de windowsCandidate
        fileim=fullfile(dirname,maskFiles(i).name);
        im=imread(fileim);
        
        %realizamos los edges de las imágenes
        BW=edge(im,'canny'); %canny extrae los bordes
        
        %calculamos transformada de Hough linear
        [Hough,Theta,Rho]=hough(BW,'RhoResolution',2,'ThetaResolution',2);
        
        %calculamos houghpeaks
        Peak=houghpeaks(Hough,8,'threshold',30);%'threshold',1);
        
        if(~isempty(Peak))
       
        %calculamos houghlines
        
        lines=houghlines(BW,Theta,Rho,Peak,'FillGap',20,'MinLength',20);
        
        figure, imshow(im), hold on
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
        end
        
    end
    