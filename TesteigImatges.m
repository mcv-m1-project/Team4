function [Metodo] = TesteigImatges (struct, train_split,dirname,dirname_new,pixel_method)


switch pixel_method
    case 'RGB'
        
        for i=1:train_split
    
        toSplit = strsplit(struct{i}.name,{'gt.','.txt'}); 

        mask_truth = imread(fullfile([dirname '/mask'], strjoin(['mask.' toSplit(2) '.png'],'')));
        mask_totest= imread(fullfile(dirname_new, strjoin(['mask_rgb_' toSplit(2) '.png'],'')));
        
        [pixelTP, pixelFP, pixelFN, pixelTN] = PerformanceAccumulationPixel(mask_totest, mask_truth);
        [pixelPrecision, pixelAccuracy, pixelSpecificity, pixelSensitivity] = PerformanceEvaluationPixel(pixelTP, pixelFP, pixelFN, pixelTN);
        
        
        Metodo{i,1}=struct('Number TP', pixelTP, 'Number FP', pixelFP, 'Number FN', pixelFN, 'Number TN', pixelTN, 'Precision', pixelPrecision, 'Accuracy', pixelAccuracy, 'Specifity', pixelSpecificity, 'Sensivity', pixelSensitivity);
        end
        
     case 'HSV'
            
        for i=1:train_split
    
        toSplit = strsplit(struct{i}.name,{'gt.','.txt'}); 

        mask_truth = imread(fullfile([dirname '/mask'], strjoin(['mask.' toSplit(2) '.png'],'')));
        mask_totest= imread(fullfile(dirname_new, strjoin(['mask_hsv_' toSplit(2) '.png'],'')));
        
        [pixelTP, pixelFP, pixelFN, pixelTN] = PerformanceAccumulationPixel(mask_totest, mask_truth);
        [pixelPrecision, pixelAccuracy, pixelSpecificity, pixelSensitivity] = PerformanceEvaluationPixel(pixelTP, pixelFP, pixelFN, pixelTN);
        
        
        Metodo{i,1}=struct('Number TP', pixelTP, 'Number FP', pixelFP, 'Number FN', pixelFN, 'Number TN', pixelTN, 'Precision', pixelPrecision, 'Accuracy', pixelAccuracy, 'Specifity', pixelSpecificity, 'Sensivity', pixelSensitivity);
        end
        
     case 'Lab'
        
        for i=1:train_split
    
        toSplit = strsplit(struct{i}.name,{'gt.','.txt'}); 

        mask_truth = imread(fullfile([dirname '/mask'], strjoin(['mask.' toSplit(2) '.png'],'')));
        mask_totest= imread(fullfile(dirname_new, strjoin(['mask_lab_' toSplit(2) '.png'],'')));
        
        [pixelTP, pixelFP, pixelFN, pixelTN] = PerformanceAccumulationPixel(mask_totest, mask_truth);
        [pixelPrecision, pixelAccuracy, pixelSpecificity, pixelSensitivity] = PerformanceEvaluationPixel(pixelTP, pixelFP, pixelFN, pixelTN);
        
        
        Metodo{i,1}=struct('Number TP', pixelTP, 'Number FP', pixelFP, 'Number FN', pixelFN, 'Number TN', pixelTN, 'Precision', pixelPrecision, 'Accuracy', pixelAccuracy, 'Specifity', pixelSpecificity, 'Sensivity', pixelSensitivity);
            
        end
end

        