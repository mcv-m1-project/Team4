%% -------------------    Task 5   -------------------  %%

% RGB LUM
dirname = 'validation_split';
dirname_new = 'validation_split/mask';

createValidationMask(sA, [dirname '/A'], 'LUM-A','RGB-LUM');
createValidationMask(sB, [dirname '/B'], 'LUM-B','RGB-LUM');
createValidationMask(sC, [dirname '/C'], 'LUM-C','RGB-LUM');
createValidationMask(sD, [dirname '/D'], 'LUM-D','RGB-LUM');
createValidationMask(sE, [dirname '/E'], 'LUM-E','RGB-LUM');
createValidationMask(sF, [dirname '/F'], 'LUM-F','RGB-LUM');

disp('Done');

dirname = 'train';
Metodo_RGBLUM_A = TesteigNImatges(sA, [dirname '/mask'], [dirname_new '/LUM-A'], 'RGB-LUM');
Metodo_RGBLUM_B = TesteigNImatges(sB, [dirname '/mask'], [dirname_new '/LUM-B'], 'RGB-LUM');
Metodo_RGBLUM_C = TesteigNImatges(sC, [dirname '/mask'], [dirname_new '/LUM-C'], 'RGB-LUM');
Metodo_RGBLUM_D = TesteigNImatges(sD, [dirname '/mask'], [dirname_new '/LUM-D'], 'RGB-LUM');
Metodo_RGBLUM_E = TesteigNImatges(sE, [dirname '/mask'], [dirname_new '/LUM-E'], 'RGB-LUM');
Metodo_RGBLUM_F = TesteigNImatges(sF, [dirname '/mask'], [dirname_new '/LUM-F'], 'RGB-LUM');

% RGB
% Calculate the average for the different signals separeted 
RGB_A_avg = calculateAverage(Metodo_RGBLUM_A);
RGB_B_avg = calculateAverage(Metodo_RGBLUM_B);
RGB_C_avg = calculateAverage(Metodo_RGBLUM_C);
RGB_D_avg = calculateAverage(Metodo_RGBLUM_D);
RGB_E_avg = calculateAverage(Metodo_RGBLUM_E);
RGB_F_avg = calculateAverage(Metodo_RGBLUM_F);

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