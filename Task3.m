%% -------------------  Task 3  -------------------  %%

dirname = 'train_split';
dirname_new = 'train_split/mask';
[s, mess, messid] = mkdir(dirname_new);

createMask(sA, [dirname '/A'], 'A');
createMask(sB, [dirname '/B'], 'B');
createMask(sC, [dirname '/C'], 'C');
createMask(sD, [dirname '/D'], 'D');
createMask(sE, [dirname '/E'], 'E');
createMask(sF, [dirname '/F'], 'F');