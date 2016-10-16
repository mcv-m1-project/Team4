function [Metodo]= calculateAverage(method)
TP=0;
FP=0;
FN=0;
TN=0;
Precision=0;
Accuracy=0;
Sensivity=0;
Specifity=0;
F1=0;
Recall=0;

for i = 1:length(method)
    TP = TP+(method{i,1}.NumberTP);
    FP = FP+(method{i,1}.NumberFP);
    FN = FN+(method{i,1}.NumberFN);
    TN = TN+(method{i,1}.NumberTN);
    Precision = Precision +(method{i,1}.Precision);
    Accuracy = Accuracy +(method{i,1}.Accuracy);
    Specifity = Specifity+(method{i,1}.Specifity);
    Sensivity = Sensivity +(method{i,1}.Sensivity);
    F1 = F1+(method{i,1}.F1);
    Recall = Recall+(method{i,1}.Recall);
    

end
    TP = TP/(length(method));
    FP = FP/(length(method));
    FN = FN/(length(method));
    TN = TN/(length(method));
    Precision = Precision /(length(method));
    Accuracy = Accuracy /(length(method));
    Specifity = Specifity/(length(method));
    Sensivity = Sensivity/(length(method));
    F1 = F1/(length(method));
    Recall = Recall/(length(method));
    Metodo = struct('NumberTP', TP, 'NumberFP', FP, 'NumberFN', FN, 'NumberTN', TN, 'Precision', Precision, 'Accuracy', Accuracy, 'Specifity', Specifity, 'Sensivity', Sensivity,'F1', F1,'Recall', Recall);

end