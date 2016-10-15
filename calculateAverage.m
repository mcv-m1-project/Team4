function [Metodo]= calculateAverage(method)

for i = 1:length(method)
    TP = sum(method{i,1}.NumberTP);
    FP = sum(method{i,1}.NumberFP);
    FN = sum(method{i,1}.NumberFN);
    TN = sum(method{i,1}.NumberTN);
    Precision = mean(method{i,1}.Precision);
    Accuracy = mean(method{i,1}.Accuracy);
    Specificity = mean(method{i,1}.Specifity);
    Sensitivity = mean(method{i,1}.Sensivity);
    F1 = mean(method{i,1}.F1);
    Recall = mean(method{i,1}.Recall);
    
    Metodo = struct('NumberTP', TP, 'NumberFP', FP, 'NumberFN', FN, 'NumberTN', TN, 'Precision', Precision, 'Accuracy', Accuracy, 'Specifity', Specificity, 'Sensivity', Sensitivity,'F1', F1,'Recall', Recall);

end
end