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
    [final] = ReadMat();
    dirname='onlytest/singleMatFile/MethodCC';
    matFiles = dir(fullfile(dirname,'*.mat')); % Get all .mat files
    
    for i = 1:length(final)
        %fileTxt = fullfile([dirname], matFiles(i).name); % File by File
        file=fullfile(dirname,final{i});
        windows = load(file);
        fileim=fullfile(dirname,maskFiles(i).name);
        im=imread(fileim);
        %leer templates
        template=imread('trianglemask.png'); %triángulo
        rows=size(template,1);
        columns=size(template,2);
        %realizar todos los templates
        %comparación imágenes
        for j=1:length(windows.windowCandidates)
            x1 = windows.windowCandidates(j).x;
            y1 = windows.windowCandidates(j).y;
            w = windows.windowCandidates(j).w;
            h = windows.windowCandidates(j).h;
            I = imcrop(im,[x1 y1 w h]);
            Iresize=imresize(I, [rows columns]);
            r=corr2(Iresize,template)
            %comparar con todos los templates
            if r<0.75 
                
            else
            %crear .mat con la ventana mayor o igual a 0.75    
        end  
        
    end
    
   % end