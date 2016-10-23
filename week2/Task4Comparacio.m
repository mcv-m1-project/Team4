dirname = 'test/Masks';
dirname_new = 'test/Masks';
sABC = dir(fullfile([dirname '/ABC'],'*.png')); % Get all .png files
sDF = dir(fullfile([dirname '/DF'],'*.png'));
sE = dir(fullfile([dirname '/E'],'*.png'));

dirname1 = 'test/mask';

Metodo_HSV_ABC = TesteigMask(sABC,dirname1,[dirname_new '/ABC'],'HSV','_ABC.png');

Metodo_HSV_DF = TesteigMask(sDF,dirname1,[dirname_new '/DF'],'HSV','_DF.png');

Metodo_HSV_E = TesteigMask(sE,dirname1,[dirname_new '/E'],'HSV','_E.png');
    
% HSV
HSV_ABC_avg = calculateAverage(Metodo_HSV_ABC);
HSV_DF_avg = calculateAverage(Metodo_HSV_DF);
HSV_E_avg = calculateAverage(Metodo_HSV_E);


HSV_TP = HSV_ABC_avg.NumberTP + HSV_DF_avg.NumberTP + HSV_E_avg.NumberTP;
HSV_TP = HSV_TP/3;
HSV_FP = HSV_ABC_avg.NumberFP + HSV_DF_avg.NumberFP + HSV_E_avg.NumberFP;
HSV_FP = HSV_FP/3;
HSV_FN = HSV_ABC_avg.NumberFN + HSV_DF_avg.NumberFN + HSV_E_avg.NumberFN;
HSV_FN = HSV_FN/3;
HSV_TN = HSV_ABC_avg.NumberTN + HSV_DF_avg.NumberTN + HSV_E_avg.NumberTN;
HSV_TN = HSV_TN/3;
HSV_Precision = [HSV_ABC_avg.Precision, HSV_DF_avg.Precision, HSV_E_avg.Precision];
HSV_Precision = mean(HSV_Precision(:));
HSV_Accuracy = [HSV_ABC_avg.Accuracy, HSV_DF_avg.Accuracy, HSV_E_avg.Accuracy];
HSV_Accuracy = mean(HSV_Accuracy(:));
HSV_Specifity = [HSV_ABC_avg.Specifity, HSV_DF_avg.Specifity, HSV_E_avg.Specifity];
HSV_Specifity = mean(HSV_Specifity(:));
HSV_Sensivity = [HSV_ABC_avg.Sensivity, HSV_DF_avg.Sensivity, HSV_E_avg.Sensivity];
HSV_Sensivity = mean(HSV_Sensivity(:));
HSV_F1 = [HSV_ABC_avg.F1, HSV_DF_avg.F1, HSV_E_avg.F1];
HSV_F1 = mean(HSV_F1(:));
HSV_Recall = [HSV_ABC_avg.Recall, HSV_DF_avg.Recall, HSV_E_avg.Recall];
HSV_Recall = mean(HSV_Recall(:));