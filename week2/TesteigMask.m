function [Metodo] = TesteigMask (structed, dirname, dirtest, pixel_method)
    % TesteigImatges
    % CheckPerfomrmance for each method (RGB, HSV, LAB & RGB-LUM)
    % 
    %    Parameter name      Value
    %    --------------      -----
    %    'structed'         Matrix struct of A, B, C, D, E or F type
    
    %    'dirname'          Current directory of each struct signl type
    %    'dirtest'          Current directory of test masks
    %    'pixel_method'     Method (RGB, HSV, LAB, RGB-LUM)
    
    k = 1;
    j = (length(structed));
    Metodo = [];

    
    if pixel_method == 'RGB'
        o=3;
        
    elseif pixel_method == 'Lab'
            o=2;
    else 
            o=1;
    end
        
    for i=o:2:j
              
       mask_truth = imread(fullfile(dirname,structed(i).name));
      
       switch pixel_method

            case 'RGB'
                               
                 mask_totest= imread(fullfile(dirtest, structed(i).name));

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
                 mask_totest= imread(fullfile(dirtest, structed(i).name));

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
                 mask_totest= imread(fullfile(dirtest, structed(i).name));

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
                 mask_totest= imread(fullfile(dirtest, structed(i).name));

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