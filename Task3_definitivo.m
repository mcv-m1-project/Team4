dirname = 'train_split_validation'; %C:\Users\Adrian\Desktop\master\M1\Team4-master\train_split_validation

%Cases RGB, HSV or Lab
createMask_definitivo(sA, vA, [dirname '/A'], 'A','RGB');
createMask_definitivo(sB, vB, [dirname '/B'], 'B','RGB');
createMask_definitivo(sC, vC, [dirname '/C'], 'C','RGB');
createMask_definitivo(sD, vD, [dirname '/D'], 'D','RGB');
createMask_definitivo(sE, vE, [dirname '/E'], 'E','RGB');
createMask_definitivo(sF, vF, [dirname '/F'], 'F','RGB');

createMask_definitivo(sA, vA, [dirname '/A'], 'A','HSV');
createMask_definitivo(sB, vB, [dirname '/B'], 'B','HSV');
createMask_definitivo(sC, vC, [dirname '/C'], 'C','HSV');
createMask_definitivo(sD, vD, [dirname '/D'], 'D','HSV');
createMask_definitivo(sE, vE, [dirname '/E'], 'E','HSV');
createMask_definitivo(sF, vF, [dirname '/F'], 'F','HSV');

createMask_definitivo(sA, vA, [dirname '/A'], 'A','Lab');
createMask_definitivo(sB, vB, [dirname '/B'], 'B','Lab');
createMask_definitivo(sC, vC, [dirname '/C'], 'C','Lab');
createMask_definitivo(sD, vD, [dirname '/D'], 'D','Lab');
createMask_definitivo(sE, vE, [dirname '/E'], 'E','Lab');
createMask_definitivo(sF, vF, [dirname '/F'], 'F','Lab');
