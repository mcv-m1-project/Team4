function [template_bw,template_color,template_gray,template_edge] = createTemplate(dirname, txtFiles, size, form_factor, prop)
    
    % [wh wh] to resize image 
    whU = round(sqrt(size.upTri .* form_factor.upTri));
    whD = round(sqrt(size.downTri .* form_factor.downTri));
    whC = round(sqrt(size.circle .* form_factor.circle));
    whS = round(sqrt(size.square .* form_factor.square));
    
    %croppedTemp = zeros([wh wh 3]);
    %croppedTemp = 0;
    gt = getGroundTruth(dirname, txtFiles);
    
    up = 0; down = 0; circle = 0; sq = 0;
    tempU = 0; tempD = 0; tempC = 0; tempS = 0;
    tempiU = 0; tempiD = 0; tempiC = 0; tempiS = 0;
    
    for i = 1:length(txtFiles)
        toSplit = strsplit(txtFiles(i).name,{'gt.','.txt'});
        fileTxt = fullfile([dirname '/gt'], strjoin(['gt.' toSplit(2) '.txt'],'')); % File by File
        image = imread(strjoin([dirname, '/', toSplit(2), '.jpg'],''));
        mask = imread(strjoin([dirname, '/mask/mask.', toSplit(2), '.png'],''));
        
        [~, s] = LoadAnnotations(fileTxt);
        
        j = 1;
        while j<=length(s)
            croppedMask = double(imcrop(mask,[gt{i}(j).x, gt{i}(j).y, gt{i}(j).w, gt{i}(j).h]));
            croppedIm = double(imcrop(image,[gt{i}(j).x, gt{i}(j).y, gt{i}(j).w, gt{i}(j).h]));
            if s{j} == 'A' % upTri
                m = imresize(croppedMask,[whU whU]);
                im = imresize(croppedIm,[whU whU]);
                tempU = tempU + m;
                tempiU = tempiU + im;
            elseif s{j} == 'B' % downTri
                m = imresize(croppedMask,[whD whD]);
                im = imresize(croppedIm,[whD whD]);
                tempD = tempD + m;
                tempiD = tempiD + im;
            elseif s{j} == 'F' % Square
                m = imresize(croppedMask,[whS whS]);
                im = imresize(croppedIm,[whS whS]);
                tempS = tempS + m;
                tempiS = tempiS + im;
            elseif s{j} == 'C' || s{j} == 'D' || s{j} == 'E' % C, D, E (Circle)
                m = imresize(croppedMask,[whC whC]);
                im = imresize(croppedIm,[whC whC]);
                tempC = tempC + m;
                tempiC = tempiC + im;
            end
       
            j = j + 1;
            
        end
        i
       
    end
    
    template_bw = struct('upTri', round(uint8(tempU/length(prop.A))), 'downTri', round(uint8(tempD/length(prop.B))), 'circle', round(uint8(tempC/(length(prop.C) + length(prop.D) + length(prop.E)))), 'square', round(uint8(tempS/length(prop.F))));
    save ('template_bw.mat', 'template_bw'); 
    template_color = struct('upTri', round(uint8(tempiU/length(prop.A))), 'downTri', round(uint8(tempiD/length(prop.B))), 'circle', round(uint8(tempiC/(length(prop.C) + length(prop.D) + length(prop.E)))), 'square', round(uint8(tempiS/length(prop.F))));
    save ('template_color.mat', 'template_color'); 
    template_gray = struct('upTri', rgb2gray(round(uint8(tempiU/length(prop.A)))), 'downTri', rgb2gray(round(uint8(tempiD/length(prop.B)))), 'circle', rgb2gray(round(uint8(tempiC/(length(prop.C) + length(prop.D) + length(prop.E))))), 'square', rgb2gray(round(uint8(tempiS/length(prop.F)))));
    save ('template_gray.mat', 'template_gray'); 
    template_edge = struct('upTri', edge(round(uint8(tempU/length(prop.A))),'Canny'), 'downTri', edge(round(uint8(tempD/length(prop.B))),'Canny'), 'circle', edge(round(uint8(tempC/(length(prop.C) + length(prop.D) + length(prop.E)))),'Canny'), 'square', edge(round(uint8(tempS/length(prop.F))),'Canny'));
    save ('template_edge.mat', 'template_edge'); 
end
