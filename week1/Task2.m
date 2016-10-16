%% -------------------  Task 2  -------------------  %%
dirname = 'train';

% Copy 70%
copySplitFile(sA,dirname,'A');
copySplitFile(sB,dirname,'B');
copySplitFile(sC,dirname,'C');
copySplitFile(sD,dirname,'D');
copySplitFile(sE,dirname,'E');
copySplitFile(sF,dirname,'F');

% Copy 30%
copyValidationFile(sA,dirname,'A');
copyValidationFile(sB,dirname,'B');
copyValidationFile(sC,dirname,'C');
copyValidationFile(sD,dirname,'D');
copyValidationFile(sE,dirname,'E');
copyValidationFile(sF,dirname,'F');


% Check PerCent
tSignal = length(sA) + length(sB) + length(sC) + length(sD) + length(sE) + length(sF);

tA = round(0.7*length(sA));
tB = round(0.7*length(sB));
tC = round(0.7*length(sC));
tD = round(0.7*length(sD));
tE = round(0.7*length(sE));
tF = round(0.7*length(sF));
tSplit = tA + tB + tC + tD + tE + tF;
perCent = tSplit/tSignal

vA = round(0.3*length(sA));
vB = round(0.3*length(sB));
vC = round(0.3*length(sC));
vD = round(0.3*length(sD));
vE = round(0.3*length(sE));
vF = round(0.3*length(sF));
vSplit = vA + vB + vC + vD + vE + vF;
perCentv = vSplit/tSignal
