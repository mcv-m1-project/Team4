function [Metodo] = TesteigImatges (structed, train_split, dirname, dirname_new, pixel_method)

    k = 1;
    j = ( length(structed) - train_split ) + 1;
    Metodo = [];

    for i=j:length(structed)
        toSplit = strsplit(structed{i}.name,{'gt.','.txt'}); 
        mask_truth = imread(fullfile(dirname, strjoin(['mask.' toSplit(2) '.png'],'')));
        M1 = graythresh(mask_truth); % Get level threshold to convert then in a binary image
        M2 = im2bw(mask_truth,M1); % Convert image to binary image
        mask_truth=M2;

        switch pixel_method

            case 'RGB'
                mask_totest= imread(fullfile(dirname_new, strjoin(['mask.' toSplit(2) '.RGB.png'],'')));

                [pixelTP, pixelFP, pixelFN, pixelTN] = PerformanceAccumulationPixel(mask_totest, mask_truth);
                [pixelPrecision, pixelAccuracy, pixelSpecificity, pixelSensitivity] = PerformanceEvaluationPixel(pixelTP, pixelFP, pixelFN, pixelTN);

                Recall=(pixelTP)/(pixelTP+pixelFN);
                F1=(2*pixelPrecision*Recall)/(pixelPrecision+Recall);
                if isnan(F1)==1
                    F1=0;
                    Recall=0;
                    pixelPrecision=0;
                    pixelSensitivity=0;
                end

                Metodo{k,1}=struct('NumberTP', pixelTP, 'NumberFP', pixelFP, 'NumberFN', pixelFN, 'NumberTN', pixelTN, 'Precision', pixelPrecision, 'Accuracy', pixelAccuracy, 'Specifity', pixelSpecificity, 'Sensivity', pixelSensitivity,'F1',F1,'Recall',Recall);
                k = k + 1;

            case 'HSV'
                mask_totest= imread(fullfile(dirname_new, strjoin(['mask.' toSplit(2) '.HSV.png'],'')));

                [pixelTP, pixelFP, pixelFN, pixelTN] = PerformanceAccumulationPixel(mask_totest, mask_truth);
                [pixelPrecision, pixelAccuracy, pixelSpecificity, pixelSensitivity] = PerformanceEvaluationPixel(pixelTP, pixelFP, pixelFN, pixelTN);

                Recall=(pixelTP)/(pixelTP+pixelFN);
                F1=(2*pixelPrecision*Recall)/(pixelPrecision+Recall);

                if isnan(F1)==1
                    F1=0;
                    Recall=0;
                    pixelPrecision=0;
                    pixelSensitivity=0;
                end

                Metodo{k,1}=struct('NumberTP', pixelTP, 'NumberFP', pixelFP, 'NumberFN', pixelFN, 'NumberTN', pixelTN, 'Precision', pixelPrecision, 'Accuracy', pixelAccuracy, 'Specifity', pixelSpecificity, 'Sensivity', pixelSensitivity,'F1',F1,'Recall',Recall);
                k = k + 1;

            case 'Lab'      
                mask_totest= imread(fullfile(dirname_new, strjoin(['mask.' toSplit(2) '.LAB.png'],'')));

                [pixelTP, pixelFP, pixelFN, pixelTN] = PerformanceAccumulationPixel(mask_totest, mask_truth);
                [pixelPrecision, pixelAccuracy, pixelSpecificity, pixelSensitivity] = PerformanceEvaluationPixel(pixelTP, pixelFP, pixelFN, pixelTN);

                Recall=(pixelTP)/(pixelTP+pixelFN);
                F1=(2*pixelPrecision*Recall)/(pixelPrecision+Recall);

                 if isnan(F1)==1
                    F1=0;
                    Recall=0;
                    pixelPrecision=0;
                    pixelSensitivity=0;
                 end

                Metodo{k,1}=struct('NumberTP', pixelTP, 'NumberFP', pixelFP, 'NumberFN', pixelFN, 'NumberTN', pixelTN, 'Precision', pixelPrecision, 'Accuracy', pixelAccuracy, 'Specifity', pixelSpecificity, 'Sensivity', pixelSensitivity,'F1',F1,'Recall',Recall); 
                k = k + 1;

            case 'RGB-LUM'
                mask_totest= imread(fullfile(dirname_new, strjoin(['mask.' toSplit(2) '.RGB-LUM.png'],'')));

                [pixelTP, pixelFP, pixelFN, pixelTN] = PerformanceAccumulationPixel(mask_totest, mask_truth);
                [pixelPrecision, pixelAccuracy, pixelSpecificity, pixelSensitivity] = PerformanceEvaluationPixel(pixelTP, pixelFP, pixelFN, pixelTN);

                Recall=(pixelTP)/(pixelTP+pixelFN);
                F1=(2*pixelPrecision*Recall)/(pixelPrecision+Recall);
                
                if isnan(F1)
                    F1=0;
                    Recall=0;
                    pixelPrecision=0;
                    pixelSensitivity=0;
                end
                
                Metodo{k,1}=struct('NumberTP', pixelTP, 'NumberFP', pixelFP, 'NumberFN', pixelFN, 'NumberTN', pixelTN, 'Precision', pixelPrecision, 'Accuracy', pixelAccuracy, 'Specifity', pixelSpecificity, 'Sensivity', pixelSensitivity,'F1',F1,'Recall',Recall);
                k = k + 1;
            
            otherwise
                disp('Incorrect Pixel Method.');

        end
    end
    
end