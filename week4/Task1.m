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
    clear all;
    clc;
    
    [final, maskFiles] = ReadMat();
    dirname='onlytest/singleMatFile/MethodCC';
    matFiles = dir(fullfile(dirname,'*.mat')); % Get all .mat files
    mkdir('Masks&Mat');
    dirnamemask='Masks&Mat';
    for i = 1:length(final)
      
        file=fullfile(dirname,final{i});
        windows=load(file); %carrega de windowsCandidate
        fileim=fullfile(dirname,maskFiles(i).name);
        im=imread(fileim);
        %leer templates
        load('template_bw.mat');
       
        k=1;
        for j=1:length(windows.windowCandidates)
            x1 = windows.windowCandidates(j).x;
            y1 = windows.windowCandidates(j).y;
            w = windows.windowCandidates(j).w;
            h = windows.windowCandidates(j).h;
            
            if x1~=0 && y1~=0 && w~=0 && h~=0 %si tenemos windows candidate:
            I = imcrop(im,[x1 y1 w h]);%cortamos la mask en la window candidate
            %hacemos del mismo tamaño todas las templates con respecto I
            %realizamos la correlación de las templates y de I
            upTriresize=imresize(template_bw.upTri, size(I));
            rupTri=corr2(upTriresize,I);
            downTriresize=imresize(template_bw.downTri, size(I));
            rdownTri=corr2(downTriresize,I);
            circleresize=imresize(template_bw.circle,size(I));
            rcircle=corr2(circleresize,I);
            squareresize=imresize(template_bw.square, size(I));
            rsquare=corr2(squareresize,I);
            else %en este caso ya no tiene windows candidate la imagen
              rupTri=0;
              rdownTri=0;
              rcircle=0;
              rsquare=0;
            end
            
            %asegurar que ningúna correlación sea Nan ya que da error 
            if isnan(rcircle) 
                rcircle=0;
            else
            end
            if isnan(rsquare) 
                rsquare=0;
            else
            end
            if isnan(rdownTri) 
                rdownTri=0;
            else
            end
            if isnan(rupTri) 
                rupTri=0;
            else
            end
            %comparar con todos los templates
            if (rupTri<0.55 && rdownTri<0.55 && rcircle<0.6 && rsquare<0.05) 
                
            else
            %crear .mat con el candidato que cumple ser window Candidate
                windowCandidatesReal(k)=windows.windowCandidates(j);
                k=k+1;
            end
            
         
        
        
        end
        if k>1   %si k=1 quiere decir que no había candidato a window Candidate, evitamos que de error con este if.
                 %guardamos los windows Candidates en el .mat windowcandidates 
            [pathstr_r,name_r,ext_r]=fileparts(maskFiles(i).name);
            windowCandidates=windowCandidatesReal;
            save([dirnamemask,'/',name_r,'.mat'],'windowCandidates');
   
            %borramos de la masks todos los pixels =1 que no son parte de la windows candidate
            Mask= paintMask (im, windowCandidates);
            imwrite(Mask, fullfile(dirnamemask,[name_r '.png']));
            
            clear windowCandidatesReal;
            clear windowCandidates;
        else
            %en este caso no hemos obtenido windows Candidates, guardamos
            %un .mat con las variables =0 para evitar problemas de lectura
            [pathstr_r,name_r,ext_r]=fileparts(maskFiles(i).name);
            windowCandidates.x=0;
            windowCandidates.y=0;
            windowCandidates.w=0;
            windowCandidates.h=0;
            save([dirnamemask,'/',name_r,'.mat'],'windowCandidates');
            im(:,:)=0;
            Mask=im;
            imwrite(Mask, fullfile(dirnamemask,[name_r '.png']));
            clear windowCandidates;
        end
        
    end
