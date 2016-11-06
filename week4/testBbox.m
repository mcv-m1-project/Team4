function method = testBbox(gtTxtFiles,gt,dirnameGT)

    % Inicialization of the variables that we want to get at the final of
    % this function (see line 34)
    TP = 0; FP = 0; FN = 0; Precision = 0; Accuracy = 0;
    Sensitivity = 0; F1 = 0; Recall = 0;

    for i=1:length(gt) % for each mask
        
        % j = 1;                 
            
        [pathstr_r,name_r,ext_r]=fileparts(gtTxtFiles(i).name); % get the whole name of the file
        load([dirnameGT, '/', [name_r,'.mat']]); % load the corresponent windowCandidates of the file
        
        % Perform PerformanceAccumulationWindow to get True Positive, False
        % Negative and False Positive variables.
        [tp, fn, fp] = PerformanceAccumulationWindow(windowCandidates, gt(i));
        
        TP  = TP + tp; % sum one by one if there is a True Positive window
        FN = FN + fn; % sum one by one if there is a False Negative window
        FP = FP + fp; % sum one by one if there is a False Positive window
        
    end
    
    % Get the variables Precision, Sensitivity and Accuracy from the value
    % that we've get before (TP, FN, FP) by the function PerformanceEvaluationWindow().
    [Precision, Sensitivity, Accuracy] = PerformanceEvaluationWindow(TP, FN, FP);
    Recall = TP/(TP + FN); % Calculate the recall
    F1=(2*Precision*Recall)/(Precision+Recall); % And also F1

    % if F1 is nan -> 0
    if isnan(F1)==1
        F1=0;
        Recall=0;
        Precision=0;
        Sensitivity=0;
    end
    
    % Save the important values of the method as a struct
    method = struct('TP', TP, 'FP', FP, 'FN', FN, 'Precision', Precision, 'Accuracy', Accuracy, 'Sensitivity', Sensitivity, 'F1', F1, 'Recall', Recall);

end