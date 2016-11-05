%Task1
%function [TrueWindows]= Task1(Dirname,final)
    % calculateAverage
    % Calculate the average for the different signals separeted
    %
    %    Parameter name      Value
    %    --------------       -----
    %     
    %    'Dirname'   Struct Method
    %    'Windows'
    [final, maskFiles] = ReadMat();
    dirname='onlytest/singleMatFile/MethodCC';
    matFiles = dir(fullfile(dirname,'*.mat')); % Get all .mat files
    
    for i = 1:length(final)
        %fileTxt = fullfile([dirname], matFiles(i).name); % File by File
        file=fullfile(dirname,final{i});
        windows=load(file); %carrega de windowsCandidate
        fileim=fullfile(dirname,maskFiles(i).name);
        im=imread(fileim);
        %leer templates
        load('template_bw.mat');
        %template_bw=double(template_bw);
        %template=imread('trianglemask.png'); %triángulo
        %rows=size(template,1);
        %columns=size(template,2);
        %realizar todos los templates
        %comparación imágenes
        k=1;
        for j=1:length(windows.windowCandidates)
            x1 = windows.windowCandidates(j).x;
            y1 = windows.windowCandidates(j).y;
            w = windows.windowCandidates(j).w;
            h = windows.windowCandidates(j).h;
            
            if x1~=0 && y1~=0 && w~=0 && h~=0 
            I = imcrop(im,[x1 y1 w h]);
            Iresize=imresize(I, size(template_bw.upTri));
            rupTri=corr2(Iresize,template_bw.upTri);
            Iresize=imresize(I, size(template_bw.downTri));
            rdownTri=corr2(Iresize,template_bw.downTri);
            Iresize=imresize(I, size(template_bw.circle));
            rcircle=corr2(Iresize,template_bw.circle);
            Iresize=imresize(I, size(template_bw.square));
            rsquare=corr2(Iresize,template_bw.square);
            else
              rupTri=0;
              rdownTri=0;
              rcircle=0;
              rsquare=0;
            end
        
            %comparar con todos los templates
            if (rupTri<0.75 && rdownTri<0.75 && rcircle<0.75 && rsquare<0.75) 
                
            else
            %crear .mat con la ventana mayor o igual a 0.75 
                windowCandidatesReal(k)=windows.windowCandidates(j);
                k=k+1;
            end
            
         
        
        
        end
        if k>1   %si k=1 vol dir que no hi havia cap window candidate! S'evita que peti.
   %guardem els windows bons en el .mat windowcandidates 
            [pathstr_r,name_r,ext_r]=fileparts(maskFiles(i).name);
            windowCandidates=windowCandidatesReal;
            save([name_r,'.mat'],'windowCandidates');
   
   %es borrem de la masks tots els pixels =1 que no son part de la windows candidate
            Mask= paintMask (im, windowCandidates);
        else
            im(:,:)=0;
            Mask=im;
        end
        
    end
