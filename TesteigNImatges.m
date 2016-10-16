function [Metodo] = TesteigNImatges (structed, dirname, dirname_new, pixel_method)

    k = 1;
    j = ( length(structed) - round(0.3*length(structed)) ) + 1; % Get Validated Images (30%)

    for i=j:length(structed)
        toSplit = strsplit(structed{i}.name,{'gt.','.txt'}); 
        mask_truth = imread(fullfile(dirname, strjoin(['mask.' toSplit(2) '.png'],'')));
        toSplit = strsplit(structed{i}.name,{'gt.','.txt'});
        
        switch pixel_method

            case 'RGB-LUM'
            mask_totest= imread(fullfile(dirname_new, strjoin(['mask.' toSplit(2) '.RGB-LUM.png'],'')));

            [pixelTP, pixelFP, pixelFN, pixelTN] = PerformanceAccumulationPixel(mask_totest, mask_truth);
            [pixelPrecision, pixelAccuracy, pixelSpecificity, pixelSensitivity] = PerformanceEvaluationPixel(pixelTP, pixelFP, pixelFN, pixelTN);

            Recall=(pixelTP)/(pixelTP+pixelFN);
            F1=(2*pixelPrecision*Recall)/(pixelPrecision+Recall);

            Metodo{k,1}=struct('NumberTP', pixelTP, 'NumberFP', pixelFP, 'NumberFN', pixelFN, 'NumberTN', pixelTN, 'Precision', pixelPrecision, 'Accuracy', pixelAccuracy, 'Specifity', pixelSpecificity, 'Sensivity', pixelSensitivity,'F1',F1,'Recall',Recall); 
            
            k = k + 1;
            otherwise
                disp('Incorrect Pixel Method.');
                
        end
    end
end