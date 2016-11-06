function [template_bw,template_color,template_gray,template_edge] = createTemplate(dirname, txtFiles, size, form_factor, prop)
    
    % get the dimension of each different shape depending on its size and
    % form factor
    whU = round(sqrt(size.upTri .* form_factor.upTri));
    whD = round(sqrt(size.downTri .* form_factor.downTri));
    whC = round(sqrt(size.circle .* form_factor.circle));
    whS = round(sqrt(size.square .* form_factor.square));
    % [wh wh] to resize image 
    
    gt = getGroundTruthT(dirname, txtFiles); % get the ground truth of all the .txt Files
    
    % Inicialization of all the variables that we will use inside the "while"
    tempU = 0; tempD = 0; tempC = 0; tempS = 0;
    tempiU = 0; tempiD = 0; tempiC = 0; tempiS = 0;
    
    for i = 1:length(txtFiles)
        
        toSplit = strsplit(txtFiles(i).name,{'gt.','.txt'}); % Split the String of the file's name
        fileTxt = fullfile([dirname '/gt'], strjoin(['gt.' toSplit(2) '.txt'],'')); % File by File
        image = imread(strjoin([dirname, '/', toSplit(2), '.jpg'],'')); % read the image
        mask = imread(strjoin([dirname, '/mask/mask.', toSplit(2), '.png'],'')); % read the mask
        
        [~, s] = LoadAnnotations(fileTxt); % We obtain the type of signal and the number of signals
        
        j = 1; % Inicialization of j
        while j<=length(s)
            
            % Cut the part of the mask with the dimensions of the corresponent ground truth 
            croppedMask = double(imcrop(mask,[gt{i}(j).x, gt{i}(j).y, gt{i}(j).w, gt{i}(j).h]));
            % The same with the image
            croppedIm = double(imcrop(image,[gt{i}(j).x, gt{i}(j).y, gt{i}(j).w, gt{i}(j).h]));
            
            if s{j} == 'A' % upTriangle (upTri)
                % Change the size of the cropped mask to the dimensions width and height
                m = imresize(croppedMask,[whU whU]); 
                im = imresize(croppedIm,[whU whU]); % The same with the image
                tempU = tempU + m; % Contains the sum of pixels (i,j) of each mask.
                tempiU = tempiU + im; % The same with the image
            elseif s{j} == 'B' % downTriangle (downTri)
                m = imresize(croppedMask,[whD whD]);
                im = imresize(croppedIm,[whD whD]);
                tempD = tempD + m;
                tempiD = tempiD + im;
            elseif s{j} == 'F' % Square
                m = imresize(croppedMask,[whS whS]);
                im = imresize(croppedIm,[whS whS]);
                tempS = tempS + m;
                tempiS = tempiS + im;
            elseif s{j} == 'C' || s{j} == 'D' || s{j} == 'E' % Circle
                m = imresize(croppedMask,[whC whC]);
                im = imresize(croppedIm,[whC whC]);
                tempC = tempC + m;
                tempiC = tempiC + im;
            end
       
            j = j + 1;
            
        end
        
        i
       
    end
    
    % Calculate the template of the mask for each shape of signal (Up Triangle, Down Triangle, Circle and Square)
    template_bw = struct('upTri', round(uint8(tempU/length(prop.A))), 'downTri', round(uint8(tempD/length(prop.B))), 'circle', round(uint8(tempC/(length(prop.C) + length(prop.D) + length(prop.E)))), 'square', round(uint8(tempS/length(prop.F))));
    save ('template_bw.mat', 'template_bw'); % save the variable template as a .mat
    
    % Calculate the template of the image in color for each shape of signal (Up Triangle, Down Triangle, Circle and Square)
    template_color = struct('upTri', round(uint8(tempiU/length(prop.A))), 'downTri', round(uint8(tempiD/length(prop.B))), 'circle', round(uint8(tempiC/(length(prop.C) + length(prop.D) + length(prop.E)))), 'square', round(uint8(tempiS/length(prop.F))));
    save ('template_color.mat', 'template_color'); % save the variable template as a .mat
    
    % Calculate the template of the image in grayscale for each shape of signal (Up Triangle, Down Triangle, Circle and Square)
    template_gray = struct('upTri', rgb2gray(round(uint8(tempiU/length(prop.A)))), 'downTri', rgb2gray(round(uint8(tempiD/length(prop.B)))), 'circle', rgb2gray(round(uint8(tempiC/(length(prop.C) + length(prop.D) + length(prop.E))))), 'square', rgb2gray(round(uint8(tempiS/length(prop.F)))));
    save ('template_gray.mat', 'template_gray'); % save the variable template as a .mat
    
    % Calculate the template of the edges of the mask for each shape of signal (Up Triangle, Down Triangle, Circle and Square)
    template_edge = struct('upTri', edge(round(uint8(tempU/length(prop.A))),'Canny'), 'downTri', edge(round(uint8(tempD/length(prop.B))),'Canny'), 'circle', edge(round(uint8(tempC/(length(prop.C) + length(prop.D) + length(prop.E)))),'Canny'), 'square', edge(round(uint8(tempS/length(prop.F))),'Canny'));
    save ('template_edge.mat', 'template_edge'); % save the variable template as a .mat

end
