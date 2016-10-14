dirname = 'train';
dirname_new = 'train_split/mask';

Metodo_RGB_A = TesteigImatges(sA,tA,[dirname '/mask'],[dirname_new '/A'],'RGB');
Metodo_HSV_A = TesteigImatges(sA,tA,[dirname '/mask'],[dirname_new '/A'],'HSV');
Metodo_Lab_A = TesteigImatges(sA,tA,[dirname '/mask'],[dirname_new '/A'],'Lab');

Metodo_RGB_B = TesteigImatges(sB,tB,[dirname '/mask'],[dirname_new '/B'],'RGB');
Metodo_HSV_B = TesteigImatges(sB,tB,[dirname '/mask'],[dirname_new '/B'],'HSV');
Metodo_Lab_B = TesteigImatges(sB,tB,[dirname '/mask'],[dirname_new '/B'],'Lab');

Metodo_RGB_C = TesteigImatges(sC,tC,[dirname '/mask'],[dirname_new '/C'],'RGB');
Metodo_HSV_C = TesteigImatges(sC,tC,[dirname '/mask'],[dirname_new '/C'],'HSV');
Metodo_Lab_C = TesteigImatges(sC,tC,[dirname '/mask'],[dirname_new '/C'],'Lab');

Metodo_RGB_D = TesteigImatges(sD,tD,[dirname '/mask'],[dirname_new '/D'],'RGB');
Metodo_HSV_D = TesteigImatges(sD,tD,[dirname '/mask'],[dirname_new '/D'],'HSV');
Metodo_Lab_D = TesteigImatges(sD,tD,[dirname '/mask'],[dirname_new '/D'],'Lab');

Metodo_RGB_E = TesteigImatges(sE,tE,[dirname '/mask'],[dirname_new '/E'],'RGB');
Metodo_HSV_E = TesteigImatges(sE,tE,[dirname '/mask'],[dirname_new '/E'],'HSV');
Metodo_Lab_E = TesteigImatges(sE,tE,[dirname '/mask'],[dirname_new '/E'],'Lab');

Metodo_RGB_F = TesteigImatges(sF,tF,[dirname '/mask'],[dirname_new '/F'],'RGB');
Metodo_HSV_F = TesteigImatges(sF,tF,[dirname '/mask'],[dirname_new '/F'],'HSV');
Metodo_Lab_F = TesteigImatges(sF,tF,[dirname '/mask'],[dirname_new '/F'],'Lab');
