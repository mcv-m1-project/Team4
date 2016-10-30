%% ====================== Task 4 (Week 3) ====================== %%

dirname = 'train';
dirnameGT = 'mejora';
gtTxtFiles = dir(fullfile(dirnameGT,'*.HSV.png')); % Get all .txt files

gt = getGroundTruth(gtTxtFiles, dirname);

load('MethodCC/windowCandidates.mat');
MethodCC = testBbox(windowCandidates,gt);
load('MethodSW/windowCandidates.mat');
MethodSW = testBbox(windowCandidates,gt);
load('MethodII/windowCandidates.mat');
MethodII = testBbox(windowCandidates,gt);
load('MethodConv/windowCandidates.mat');
MethodConv = testBbox(windowCandidates,gt);


