dirname = '/Users/Toni/Desktop/Toni/Master/ProjectMaterials/Week 1/Code/train';
dirname_new = 'train_split_validation/mask';

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
Metodo_HSV_F = TesteigImatges(sF,vf,[dirname '/mask'],[dirname_new '/F'],'HSV');
Metodo_Lab_F = TesteigImatges(sF,vF,[dirname '/mask'],[dirname_new '/F'],'Lab');

% RGB
RGB_A_avg = calculateAverage(Metodo_RGB_A);
RGB_B_avg = calculateAverage(Metodo_RGB_B);
RGB_C_avg = calculateAverage(Metodo_RGB_C);
RGB_D_avg = calculateAverage(Metodo_RGB_D);
RGB_E_avg = calculateAverage(Metodo_RGB_E);
RGB_F_avg = calculateAverage(Metodo_RGB_F);



% HSV
HSV_A_avg = calculateAverage(Metodo_HSV_A);
HSV_B_avg = calculateAverage(Metodo_HSV_B);
HSV_C_avg = calculateAverage(Metodo_HSV_C);
HSV_D_avg = calculateAverage(Metodo_HSV_D);
HSV_E_avg = calculateAverage(Metodo_HSV_E);
HSV_F_avg = calculateAverage(Metodo_HSV_F);

% Lab
Lab_A_avg = calculateAverage(Metodo_Lab_A);
Lab_B_avg = calculateAverage(Metodo_Lab_B);
Lab_C_avg = calculateAverage(Metodo_Lab_C);
Lab_D_avg = calculateAverage(Metodo_Lab_D);
Lab_E_avg = calculateAverage(Metodo_Lab_E);
Lab_F_avg = calculateAverage(Metodo_Lab_F);
