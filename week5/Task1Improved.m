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
        o=1;
        for j=1:length(windows.windowCandidates)
        SquareTriangle = HoughSquareTriangle(im,windows.windowCandidates(j));
        if SquareTriangle == 1
            finalwindows(o) = windows.windowCandidates(j);
        else
            
        end
        end
        
        clear windows
        
        for k=1:length(finalwindows)
            windows.windowCandidates(k)=finalwindows(k);
        end
                  
    end