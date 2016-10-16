dirname = '/Users/Toni/Desktop/Toni/Master/ProjectMaterials/Week 1/Code/train';
dirname_new = 'validation_split/mask';

Metodo_RGB_A = TesteigImatges(sA,vA,[dirname '/mask'],[dirname_new '/A'],'RGB');
Metodo_HSV_A = TesteigImatges(sA,vA,[dirname '/mask'],[dirname_new '/A'],'HSV');
Metodo_Lab_A = TesteigImatges(sA,vA,[dirname '/mask'],[dirname_new '/A'],'Lab');

Metodo_RGB_B = TesteigImatges(sB,vB,[dirname '/mask'],[dirname_new '/B'],'RGB');
Metodo_HSV_B = TesteigImatges(sB,vB,[dirname '/mask'],[dirname_new '/B'],'HSV');
Metodo_Lab_B = TesteigImatges(sB,vB,[dirname '/mask'],[dirname_new '/B'],'Lab');

Metodo_RGB_C = TesteigImatges(sC,vC,[dirname '/mask'],[dirname_new '/C'],'RGB');
Metodo_HSV_C = TesteigImatges(sC,vC,[dirname '/mask'],[dirname_new '/C'],'HSV');
Metodo_Lab_C = TesteigImatges(sC,vC,[dirname '/mask'],[dirname_new '/C'],'Lab');

Metodo_RGB_D = TesteigImatges(sD,vD,[dirname '/mask'],[dirname_new '/D'],'RGB');
Metodo_HSV_D = TesteigImatges(sD,vD,[dirname '/mask'],[dirname_new '/D'],'HSV');
Metodo_Lab_D = TesteigImatges(sD,vD,[dirname '/mask'],[dirname_new '/D'],'Lab');

Metodo_RGB_E = TesteigImatges(sE,vE,[dirname '/mask'],[dirname_new '/E'],'RGB');
Metodo_HSV_E = TesteigImatges(sE,vE,[dirname '/mask'],[dirname_new '/E'],'HSV');
Metodo_Lab_E = TesteigImatges(sE,vE,[dirname '/mask'],[dirname_new '/E'],'Lab');

Metodo_RGB_F = TesteigImatges(sF,vF,[dirname '/mask'],[dirname_new '/F'],'RGB');
Metodo_HSV_F = TesteigImatges(sF,vF,[dirname '/mask'],[dirname_new '/F'],'HSV');
Metodo_Lab_F = TesteigImatges(sF,vF,[dirname '/mask'],[dirname_new '/F'],'Lab');

% RGB
% Calculate the average for the different signals separeted 
RGB_A_avg = calculateAverage(Metodo_RGB_A);
RGB_B_avg = calculateAverage(Metodo_RGB_B);
RGB_C_avg = calculateAverage(Metodo_RGB_C);
RGB_D_avg = calculateAverage(Metodo_RGB_D);
RGB_E_avg = calculateAverage(Metodo_RGB_E);
RGB_F_avg = calculateAverage(Metodo_RGB_F);

RGB_TP = RGB_A_avg.NumberTP + RGB_B_avg.NumberTP + RGB_C_avg.NumberTP +  RGB_D_avg.NumberTP +  RGB_E_avg.NumberTP +  RGB_F_avg.NumberTP;
RGB_TP = RGB_TP/6;
RGB_FP = RGB_A_avg.NumberFP + RGB_B_avg.NumberFP + RGB_C_avg.NumberFP +  RGB_D_avg.NumberFP +  RGB_E_avg.NumberFP +  RGB_F_avg.NumberFP;
RGB_FP = RGB_FP/6;
RGB_FN = RGB_A_avg.NumberFN + RGB_B_avg.NumberFN + RGB_C_avg.NumberFN +  RGB_D_avg.NumberFN +  RGB_E_avg.NumberFN +  RGB_F_avg.NumberFN;
RGB_FN = RGB_FN/6;
RGB_TN = RGB_A_avg.NumberTN + RGB_B_avg.NumberTN + RGB_C_avg.NumberTN +  RGB_D_avg.NumberTN +  RGB_E_avg.NumberTN +  RGB_F_avg.NumberTN;
RGB_TN = RGB_TN/6;
RGB_Precision = [RGB_A_avg.Precision, RGB_B_avg.Precision, RGB_C_avg.Precision, RGB_D_avg.Precision, RGB_E_avg.Precision, RGB_F_avg.Precision];
RGB_Precision = mean(RGB_Precision(:));
RGB_Accuracy = [RGB_A_avg.Accuracy, RGB_B_avg.Accuracy, RGB_C_avg.Accuracy, RGB_D_avg.Accuracy, RGB_E_avg.Accuracy, RGB_F_avg.Accuracy];
RGB_Accuracy = mean(RGB_Accuracy(:));
RGB_Specifity = [RGB_A_avg.Specifity, RGB_B_avg.Specifity, RGB_C_avg.Specifity, RGB_D_avg.Specifity, RGB_E_avg.Specifity, RGB_F_avg.Specifity];
RGB_Specifity = mean(RGB_Specifity(:));
RGB_Sensivity = [RGB_A_avg.Sensivity, RGB_B_avg.Sensivity, RGB_C_avg.Sensivity, RGB_D_avg.Sensivity, RGB_E_avg.Sensivity, RGB_F_avg.Sensivity];
RGB_Sensivity = mean(RGB_Sensivity);
RGB_F1 = [RGB_A_avg.F1, RGB_B_avg.F1, RGB_C_avg.F1, RGB_D_avg.F1, RGB_E_avg.F1, RGB_F_avg.F1];
RGB_F1 = mean(RGB_F1(:));
RGB_Recall = [RGB_A_avg.Recall, RGB_B_avg.Recall, RGB_C_avg.Recall, RGB_D_avg.Recall, RGB_E_avg.Recall, RGB_F_avg.Recall];
RGB_Recall = mean(RGB_Recall(:));
     
% HSV
HSV_A_avg = calculateAverage(Metodo_HSV_A);
HSV_B_avg = calculateAverage(Metodo_HSV_B);
HSV_C_avg = calculateAverage(Metodo_HSV_C);
HSV_D_avg = calculateAverage(Metodo_HSV_D);
HSV_E_avg = calculateAverage(Metodo_HSV_E);
HSV_F_avg = calculateAverage(Metodo_HSV_F);

HSV_TP = HSV_A_avg.NumberTP + HSV_B_avg.NumberTP + HSV_C_avg.NumberTP +  HSV_D_avg.NumberTP +  HSV_E_avg.NumberTP +  HSV_F_avg.NumberTP;
HSV_TP = HSV_TP/6;
HSV_FP = HSV_A_avg.NumberFP + HSV_B_avg.NumberFP + HSV_C_avg.NumberFP +  HSV_D_avg.NumberFP +  HSV_E_avg.NumberFP +  HSV_F_avg.NumberFP;
HSV_FP = HSV_FP/6;
HSV_FN = HSV_A_avg.NumberFN + HSV_B_avg.NumberFN + HSV_C_avg.NumberFN +  HSV_D_avg.NumberFN +  HSV_E_avg.NumberFN +  HSV_F_avg.NumberFN;
HSV_FN = HSV_FN/6;
HSV_TN = HSV_A_avg.NumberTN + HSV_B_avg.NumberTN + HSV_C_avg.NumberTN +  HSV_D_avg.NumberTN +  HSV_E_avg.NumberTN +  HSV_F_avg.NumberTN;
HSV_TN = HSV_TN/6;
HSV_Precision = [HSV_A_avg.Precision, HSV_B_avg.Precision, HSV_C_avg.Precision, HSV_D_avg.Precision, HSV_E_avg.Precision, HSV_F_avg.Precision];
HSV_Precision = mean(HSV_Precision(:));
HSV_Accuracy = [HSV_A_avg.Accuracy, HSV_B_avg.Accuracy, HSV_C_avg.Accuracy, HSV_D_avg.Accuracy, HSV_E_avg.Accuracy, HSV_F_avg.Accuracy];
HSV_Accuracy = mean(HSV_Accuracy(:));
HSV_Specifity = [HSV_A_avg.Specifity, HSV_B_avg.Specifity, HSV_C_avg.Specifity, HSV_D_avg.Specifity, HSV_E_avg.Specifity, HSV_F_avg.Specifity];
HSV_Specifity = mean(HSV_Specifity(:));
HSV_Sensivity = [HSV_A_avg.Sensivity, HSV_B_avg.Sensivity, HSV_C_avg.Sensivity, HSV_D_avg.Sensivity, HSV_E_avg.Sensivity, HSV_F_avg.Sensivity];
HSV_Sensivity = mean(HSV_Sensivity(:));
HSV_F1 = [HSV_A_avg.F1, HSV_B_avg.F1, HSV_C_avg.F1, HSV_D_avg.F1, HSV_E_avg.F1, HSV_F_avg.F1];
HSV_F1 = mean(HSV_F1(:));
HSV_Recall = [HSV_A_avg.Recall, HSV_B_avg.Recall, HSV_C_avg.Recall, HSV_D_avg.Recall, HSV_E_avg.Recall, HSV_F_avg.Recall];
HSV_Recall = mean(HSV_Recall(:));

% Lab
Lab_A_avg = calculateAverage(Metodo_Lab_A);
Lab_B_avg = calculateAverage(Metodo_Lab_B);
Lab_C_avg = calculateAverage(Metodo_Lab_C);
Lab_D_avg = calculateAverage(Metodo_Lab_D);
Lab_E_avg = calculateAverage(Metodo_Lab_E);
Lab_F_avg = calculateAverage(Metodo_Lab_F);

Lab_TP = Lab_A_avg.NumberTP + Lab_B_avg.NumberTP + Lab_C_avg.NumberTP +  Lab_D_avg.NumberTP +  Lab_E_avg.NumberTP +  Lab_F_avg.NumberTP;
Lab_TP = Lab_TP/6;
Lab_FP = Lab_A_avg.NumberFP + Lab_B_avg.NumberFP + Lab_C_avg.NumberFP +  Lab_D_avg.NumberFP +  Lab_E_avg.NumberFP +  Lab_F_avg.NumberFP;
Lab_FP = Lab_FP/6;
Lab_FN = Lab_A_avg.NumberFN + Lab_B_avg.NumberFN + Lab_C_avg.NumberFN +  Lab_D_avg.NumberFN +  Lab_E_avg.NumberFN +  Lab_F_avg.NumberFN;
Lab_FN = Lab_FN/6;
Lab_TN = Lab_A_avg.NumberTN + Lab_B_avg.NumberTN + Lab_C_avg.NumberTN +  Lab_D_avg.NumberTN +  Lab_E_avg.NumberTN +  Lab_F_avg.NumberTN;
Lab_TN = Lab_TN/6;
Lab_Precision = [Lab_A_avg.Precision, Lab_B_avg.Precision, Lab_C_avg.Precision, Lab_D_avg.Precision, Lab_E_avg.Precision, Lab_F_avg.Precision];
Lab_Precision = mean(Lab_Precision(:));
Lab_Accuracy = [Lab_A_avg.Accuracy, Lab_B_avg.Accuracy, Lab_C_avg.Accuracy, Lab_D_avg.Accuracy, Lab_E_avg.Accuracy, Lab_F_avg.Accuracy];
Lab_Accuracy = mean(Lab_Accuracy(:));
Lab_Specifity = [Lab_A_avg.Specifity, Lab_B_avg.Specifity, Lab_C_avg.Specifity, Lab_D_avg.Specifity, Lab_E_avg.Specifity, Lab_F_avg.Specifity];
Lab_Specifity = mean(Lab_Specifity(:));
Lab_Sensivity = [Lab_A_avg.Sensivity, Lab_B_avg.Sensivity, Lab_C_avg.Sensivity, Lab_D_avg.Sensivity, Lab_E_avg.Sensivity, Lab_F_avg.Sensivity];
Lab_Sensivity = mean(Lab_Sensivity(:));
Lab_F1 = [Lab_A_avg.F1, Lab_B_avg.F1, Lab_C_avg.F1, Lab_D_avg.F1, Lab_E_avg.F1, Lab_F_avg.F1];
Lab_F1 = mean(Lab_F1(:));
Lab_Recall = [Lab_A_avg.Recall, Lab_B_avg.Recall, Lab_C_avg.Recall, Lab_D_avg.Recall, Lab_E_avg.Recall, Lab_F_avg.Recall];
Lab_Recall = mean(Lab_Recall(:));