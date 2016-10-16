function [Metodo] = TesteigImatges (structed, train_split,dirname,dirname_new,pixel_method)

kRGB=0;
kHSV=0;
kLab=0;
j = ( length(structed) - round(0.3*length(structed)) ) + 1;

for i=j:length(structed)
    switch pixel_method
        
        case 'RGB'
        toSplit = strsplit(structed{i}.name,{'gt.','.txt'}); 

        mask_truth = imread(fullfile(dirname, strjoin(['mask.' toSplit(2) '.png'],'')));
        mask_totest= imread(fullfile(dirname_new, strjoin(['mask.' toSplit(2) '.RGB.png'],'')));
        
        [pixelTP, pixelFP, pixelFN, pixelTN] = PerformanceAccumulationPixel(mask_totest, mask_truth);
        [pixelPrecision, pixelAccuracy, pixelSpecificity, pixelSensitivity] = PerformanceEvaluationPixel(pixelTP, pixelFP, pixelFN, pixelTN);
        
        Recall=(pixelTP)/(pixelTP+pixelFN);
        F1=(2*pixelPrecision*Recall)/(pixelPrecision+Recall);
        kRGB=kRGB+1;
        Metodo{kRGB,1}=struct('NumberTP', pixelTP, 'NumberFP', pixelFP, 'NumberFN', pixelFN, 'NumberTN', pixelTN, 'Precision', pixelPrecision, 'Accuracy', pixelAccuracy, 'Specifity', pixelSpecificity, 'Sensivity', pixelSensitivity,'F1',F1,'Recall',Recall);
        
        case 'HSV'
        toSplit = strsplit(structed{i}.name,{'gt.','.txt'}); 

        mask_truth = imread(fullfile(dirname, strjoin(['mask.' toSplit(2) '.png'],'')));
        mask_totest= imread(fullfile(dirname_new, strjoin(['mask.' toSplit(2) '.HSV.png'],'')));
        
        [pixelTP, pixelFP, pixelFN, pixelTN] = PerformanceAccumulationPixel(mask_totest, mask_truth);
        [pixelPrecision, pixelAccuracy, pixelSpecificity, pixelSensitivity] = PerformanceEvaluationPixel(pixelTP, pixelFP, pixelFN, pixelTN);
        
        Recall=(pixelTP)/(pixelTP+pixelFN);
        F1=(2*pixelPrecision*Recall)/(pixelPrecision+Recall);
        
        kHSV=kHSV+1;        
        Metodo{kHSV,1}=struct('NumberTP', pixelTP, 'NumberFP', pixelFP, 'NumberFN', pixelFN, 'NumberTN', pixelTN, 'Precision', pixelPrecision, 'Accuracy', pixelAccuracy, 'Specifity', pixelSpecificity, 'Sensivity', pixelSensitivity,'F1',F1,'Recall',Recall);
        
        case 'Lab'
        toSplit = strsplit(structed{i}.name,{'gt.','.txt'}); 

        mask_truth = imread(fullfile(dirname, strjoin(['mask.' toSplit(2) '.png'],'')));
        mask_totest= imread(fullfile(dirname_new, strjoin(['mask.' toSplit(2) '.LAB.png'],'')));
        
        [pixelTP, pixelFP, pixelFN, pixelTN] = PerformanceAccumulationPixel(mask_totest, mask_truth);
        [pixelPrecision, pixelAccuracy, pixelSpecificity, pixelSensitivity] = PerformanceEvaluationPixel(pixelTP, pixelFP, pixelFN, pixelTN);
        
        Recall=(pixelTP)/(pixelTP+pixelFN);
        F1=(2*pixelPrecision*Recall)/(pixelPrecision+Recall);
        
        kLab=kLab+1;
        Metodo{kLab,1}=struct('NumberTP', pixelTP, 'NumberFP', pixelFP, 'NumberFN', pixelFN, 'NumberTN', pixelTN, 'Precision', pixelPrecision, 'Accuracy', pixelAccuracy, 'Specifity', pixelSpecificity, 'Sensivity', pixelSensitivity,'F1',F1,'Recall',Recall); 
    end
end
end

