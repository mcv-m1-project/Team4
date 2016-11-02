function createTemplate(dirname, size, form_factor)

wh = round(sqrt(size.*form_factor));

    for i = 1:length(txtFiles)
        toSplit = strsplit(txtFiles(i).name,{'gt.','.txt'});
        %fileTxt = fullfile([dirname '/gt'], strjoin(['gt.' toSplit(2) '.txt'],'')); % File by File
        im = imread(strjoin([dirname, '/', toSplit(2), '.jpg'],''));
        mask = imread(strjoin([dirname, '/mask/mask.', toSplit(2), '.png'],''));
        croppedMask = double(imcrop(mask,[gt(i).x,gt(i).y,gt(i).w,gt(i).h]));
        croppedMask = imresize(croppedMask,[wh, wh]);

        
    end


end