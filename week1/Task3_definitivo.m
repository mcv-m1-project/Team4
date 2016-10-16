%% -------------------  Task 3  -------------------  %%

dirname = 'train_split';

% Test Mask
createTrainMask(sA, [dirname '/A'], 'A','RGB');
createTrainMask(sB, [dirname '/B'], 'B','RGB');
createTrainMask(sC, [dirname '/C'], 'C','RGB');
createTrainMask(sD, [dirname '/D'], 'D','RGB');
createTrainMask(sE, [dirname '/E'], 'E','RGB');
createTrainMask(sF, [dirname '/F'], 'F','RGB');
disp('RGB Created');

createTrainMask(sA, [dirname '/A'], 'A','HSV');
createTrainMask(sB, [dirname '/B'], 'B','HSV');
createTrainMask(sC, [dirname '/C'], 'C','HSV');
createTrainMask(sD, [dirname '/D'], 'D','HSV');
createTrainMask(sE, [dirname '/E'], 'E','HSV');
createTrainMask(sF, [dirname '/F'], 'F','HSV');
disp('HSV Created');

createTrainMask(sA, [dirname '/A'], 'A','Lab');
createTrainMask(sB, [dirname '/B'], 'B','Lab');
createTrainMask(sC, [dirname '/C'], 'C','Lab');
createTrainMask(sD, [dirname '/D'], 'D','Lab');
createTrainMask(sE, [dirname '/E'], 'E','Lab');
createTrainMask(sF, [dirname '/F'], 'F','Lab');
disp('LAB Created');

%%  Validation Mask
dirname = 'validation_split';

createValidationMask(sA, [dirname '/A'], 'A','RGB');
createValidationMask(sB, [dirname '/B'], 'B','RGB');
createValidationMask(sC, [dirname '/C'], 'C','RGB');
createValidationMask(sD, [dirname '/D'], 'D','RGB');
createValidationMask(sE, [dirname '/E'], 'E','RGB');
createValidationMask(sF, [dirname '/F'], 'F','RGB');
disp('RGB Created');

createValidationMask(sA, [dirname '/A'], 'A','HSV');
createValidationMask(sB, [dirname '/B'], 'B','HSV');
createValidationMask(sC, [dirname '/C'], 'C','HSV');
createValidationMask(sD, [dirname '/D'], 'D','HSV');
createValidationMask(sE, [dirname '/E'], 'E','HSV');
createValidationMask(sF, [dirname '/F'], 'F','HSV');
disp('HSV Created');

createValidationMask(sA, [dirname '/A'], 'A','Lab');
createValidationMask(sB, [dirname '/B'], 'B','Lab');
createValidationMask(sC, [dirname '/C'], 'C','Lab');
createValidationMask(sD, [dirname '/D'], 'D','Lab');
createValidationMask(sE, [dirname '/E'], 'E','Lab');
createValidationMask(sF, [dirname '/F'], 'F','Lab');
disp('LAB Created');
