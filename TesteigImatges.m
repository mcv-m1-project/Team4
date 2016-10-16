function [Metodo] = TesteigImatges (structed, train_split,dirname,dirname_new,pixel_method)

kRGB=0;
kHSV=0;
kLab=0;
j= length(structed) - (round(0.3*length(structed)));

switch pixel_method
    case 'RGB'
        
        for i=1:train_split
    
        toSplit = strsplit(structed{j}.name,{'gt.','.txt'}); 

        mask_truth = imread(fullfile([dirname], strjoin(['mask.' toSplit(2) '.png'],'')));
        mask_totest= imread(fullfile(dirname_new, strjoin(['mask_rgb_' toSplit(2) '.png'],'')));
        
        [pixelTP, pixelFP, pixelFN, pixelTN] = PerformanceAccumulationPixel(mask_totest, mask_truth);
        [pixelPrecision, pixelAccuracy, pixelSpecificity, pixelSensitivity] = PerformanceEvaluationPixel(pixelTP, pixelFP, pixelFN, pixelTN);
        
        Recall=(pixelTP)/(pixelTP+pixelFN);
        F1=(2*pixelPrecision*Recall)/(pixelPrecision+Recall);
        kRGB=kRGB+1;
        Metodo{kRGB,1}=struct('NumberTP', pixelTP, 'NumberFP', pixelFP, 'NumberFN', pixelFN, 'NumberTN', pixelTN, 'Precision', pixelPrecision, 'Accuracy', pixelAccuracy, 'Specifity', pixelSpecificity, 'Sensivity', pixelSensitivity,'F1',F1,'Recall',Recall);
        j=j+1;
        end
        
     case 'HSV'
            
        for i=1:train_split
    
        toSplit = strsplit(structed{j}.name,{'gt.','.txt'}); 

        mask_truth = imread(fullfile([dirname], strjoin(['mask.' toSplit(2) '.png'],'')));
        mask_totest= imread(fullfile(dirname_new, strjoin(['mask_hsv_' toSplit(2) '.png'],'')));
        
        [pixelTP, pixelFP, pixelFN, pixelTN] = PerformanceAccumulationPixel(mask_totest, mask_truth);
        [pixelPrecision, pixelAccuracy, pixelSpecificity, pixelSensitivity] = PerformanceEvaluationPixel(pixelTP, pixelFP, pixelFN, pixelTN);
        
        Recall=(pixelTP)/(pixelTP+pixelFN);
        F1=(2*pixelPrecision*Recall)/(pixelPrecision+Recall);
        
        kHSV=kHSV+1;        
        Metodo{kHSV,1}=struct('NumberTP', pixelTP, 'NumberFP', pixelFP, 'NumberFN', pixelFN, 'NumberTN', pixelTN, 'Precision', pixelPrecision, 'Accuracy', pixelAccuracy, 'Specifity', pixelSpecificity, 'Sensivity', pixelSensitivity,'F1',F1,'Recall',Recall);
        j=j+1;
        end
        
     case 'Lab'
        
        for i=1:train_split
    
        toSplit = strsplit(structed{j}.name,{'gt.','.txt'}); 

        mask_truth = imread(fullfile([dirname], strjoin(['mask.' toSplit(2) '.png'],'')));
        mask_totest= imread(fullfile(dirname_new, strjoin(['mask_lab_' toSplit(2) '.png'],'')));
        
        [pixelTP, pixelFP, pixelFN, pixelTN] = PerformanceAccumulationPixel(mask_totest, mask_truth);
        [pixelPrecision, pixelAccuracy, pixelSpecificity, pixelSensitivity] = PerformanceEvaluationPixel(pixelTP, pixelFP, pixelFN, pixelTN);
        
        Recall=(pixelTP)/(pixelTP+pixelFN);
        F1=(2*pixelPrecision*Recall)/(pixelPrecision+Recall);
        
        kLab=kLab+1;
        Metodo{kLab,1}=struct('NumberTP', pixelTP, 'NumberFP', pixelFP, 'NumberFN', pixelFN, 'NumberTN', pixelTN, 'Precision', pixelPrecision, 'Accuracy', pixelAccuracy, 'Specifity', pixelSpecificity, 'Sensivity', pixelSensitivity,'F1',F1,'Recall',Recall);
        j=j+1;   
        end
end

