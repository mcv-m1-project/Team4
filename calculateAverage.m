function [Metodo]= calculateAverage(method)

for i = 1:length(method)
    RGB_TP = sum(method{i,1}.NumberTP);
    RGB_FP = sum(method{i,1}.NumberFP);
    RGB_FN = sum(method{i,1}.NumberFN);
    RGB_TN = sum(method{i,1}.NumberTN);
    RGB_Precision = mean(method{i,1}.Precision);
    RGB_Accuracy = mean(method{i,1}.Accuracy);
    RGB_Specificity = mean(method{i,1}.Specifity);
    RGB_Sensitivity = mean(method{i,1}.Sensivity);
    RGB_F1 = mean(method{i,1}.F1);
    RGB_Recall = mean(method{i,1}.Recall);
    
    Metodo = struct('NumberTP', RGB_TP, 'NumberFP', RGB_FP, 'NumberFN', RGB_FN, 'NumberTN', RGB_TN, 'Precision', RGB_Precision, 'Accuracy', RGB_Accuracy, 'Specifity', RGB_Specificity, 'Sensivity', RGB_Sensitivity,'F1', RGB_F1,'Recall', RGB_Recall);

end
end