%% -------------------  Task 2  -------------------  %%
dirname = 'train';

copySplitFile(sA,dirname,'A');
copySplitFile(sB,dirname,'B');
copySplitFile(sC,dirname,'C');
copySplitFile(sD,dirname,'D');
copySplitFile(sE,dirname,'E');
copySplitFile(sF,dirname,'F');

tSignal = length(sA) + length(sB) + length(sC) + length(sD) + length(sE) + length(sF);

tA = round(0.7*length(sA));
tB = round(0.7*length(sB));
tC = round(0.7*length(sC));
tD = round(0.7*length(sD));
tE = round(0.7*length(sE));
tF = round(0.7*length(sF));
tSplit = tA + tB + tC + tD + tE + tF;
perCent = tSplit/tSignal