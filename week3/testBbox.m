function method = testBbox(ourBbox,gt)
  
    TP = 0; FP = 0; FN = 0; Precision = 0; Accuracy = 0;
    Sensitivity = 0; F1 = 0; Recall = 0;

    for i=1:length(gt) % for each mask
        
        j=1;
        clear sBbox
        while j<=length(ourBbox(i).x) % for each windowCanidate
            sBbox(j,1) = struct('x', ourBbox(i).x(j), 'y', ourBbox(i).y(j), 'w', ourBbox(i).w(j), 'h', ourBbox(i).h(j));
            j = j + 1;
        end           
        
        [tp, fn, fp] = PerformanceAccumulationWindow(sBbox, gt(i));
        
        TP  = TP + tp;
        FN = FN + fn;
        FP = FP + fp;
        
    end
    
    [Precision, Sensitivity, Accuracy] = PerformanceEvaluationWindow(TP, FN, FP);
    Recall = TP/(TP + FN);
    F1=(2*Precision*Recall)/(Precision+Recall);

    if isnan(F1)==1
        F1=0;
        Recall=0;
        Precision=0;
        Sensitivity=0;
    end
    
    method = struct('TP', TP, 'FP', FP, 'FN', FN, 'Precision', Precision, 'Accuracy', Accuracy, 'Sensitivity', Sensitivity, 'F1', F1, 'Recall', Recall);
end
