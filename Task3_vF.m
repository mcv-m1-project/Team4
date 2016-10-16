%% -------------------  Task 3  -------------------  %%

dirname = 'train_split';
dirname_new = 'train_split/mask';
[s, mess, messid] = mkdir(dirname_new);

% Test Mask
createTrainMask(sA, [dirname '/A'], 'A','RGB');
createTrainMask(sB, [dirname '/B'], 'B','RGB');
createTrainMask(sC, [dirname '/C'], 'C','RGB');
createTrainMask(sD, [dirname '/D'], 'D','RGB');
createTrainMask(sE, [dirname '/E'], 'E','RGB');
createTrainMask(sF, [dirname '/F'], 'F','RGB');

createTrainMask(sA, [dirname '/A'], 'A','HSV');
createTrainMask(sB, [dirname '/B'], 'B','HSV');
createTrainMask(sC, [dirname '/C'], 'C','HSV');
createTrainMask(sD, [dirname '/D'], 'D','HSV');
createTrainMask(sE, [dirname '/E'], 'E','HSV');
createTrainMask(sF, [dirname '/F'], 'F','HSV');

createTrainMask(sA, [dirname '/A'], 'A','Lab');
createTrainMask(sB, [dirname '/B'], 'B','Lab');
createTrainMask(sC, [dirname '/C'], 'C','Lab');
createTrainMask(sD, [dirname '/D'], 'D','Lab');
createTrainMask(sE, [dirname '/E'], 'E','Lab');
createTrainMask(sF, [dirname '/F'], 'F','Lab');

% Validation Mask
createValidationMask(sA, [dirname '/A'], 'A','RGB');
createValidationMask(sB, [dirname '/B'], 'B','RGB');
createValidationMask(sC, [dirname '/C'], 'C','RGB');
createValidationMask(sD, [dirname '/D'], 'D','RGB');
createValidationMask(sE, [dirname '/E'], 'E','RGB');
createValidationMask(sF, [dirname '/F'], 'F','RGB');

createValidationMask(sA, [dirname '/A'], 'A','HSV');
createValidationMask(sB, [dirname '/B'], 'B','HSV');
createValidationMask(sC, [dirname '/C'], 'C','HSV');
createValidationMask(sD, [dirname '/D'], 'D','HSV');
createValidationMask(sE, [dirname '/E'], 'E','HSV');
createValidationMask(sF, [dirname '/F'], 'F','HSV');

createValidationMask(sA, [dirname '/A'], 'A','Lab');
createValidationMask(sB, [dirname '/B'], 'B','Lab');
createValidationMask(sC, [dirname '/C'], 'C','Lab');
createValidationMask(sD, [dirname '/D'], 'D','Lab');
createValidationMask(sE, [dirname '/E'], 'E','Lab');
createValidationMask(sF, [dirname '/F'], 'F','Lab');