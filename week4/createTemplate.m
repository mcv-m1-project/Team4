function croppedTemp = createTemplate(dirname, txtFiles, size, form_factor)

    wh = round(sqrt(size.*form_factor));
    croppedTemp = zeros([wh wh 3]);
    gt = getGroundTruth(dirname, txtFiles);
    
    for i = 1:length(txtFiles)
        toSplit = strsplit(txtFiles(i).name,{'gt.','.txt'});
        
        %fileTxt = fullfile([dirname '/gt'], strjoin(['gt.' toSplit(2) '.txt'],'')); % File by File
        im = imread(strjoin([dirname, '/', toSplit(2), '.jpg'],''));
        
        mask = imread(strjoin([dirname, '/mask/mask.', toSplit(2), '.png'],''));
        croppedMask = double(imcrop(im,[gt(i).x,gt(i).y,gt(i).w,gt(i).h]));
        croppedMask = imresize(croppedMask,[wh wh]);
        
        croppedTemp = croppedTemp + im;
    end

end