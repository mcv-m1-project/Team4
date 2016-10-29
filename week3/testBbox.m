function method = testBbox(ourBbox,gt)

Precision = 0;
Sensitivity = 0;
Accuracy = 0;

% switch method
% 
%     case 'CC'
[TP,FN,FP] = PerformanceAccumulationWindow(ourBbox, gt);
[Precision, Sensitivity, Accuracy] = PerformanceEvaluationWindow(TP, FN, FP);
    
Recall = TP/(TP + FN);
F1=(2*Precision*Recall)/(Precision+Recall);
    if isnan(F1)==1
        F1=0;
        Recall=0;
        Precision=0;
        Sensitivity=0;
    end

method = struct('TP', TP, 'FP', FP, 'FN', FN,'Precision', Precision, 'Accuracy', Accuracy, 'Sensitivity', Sensitivity,'F1', F1,'Recall', Recall);
                 
end
