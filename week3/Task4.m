%% ====================== Task 4 (Week 3) ====================== %%

dirname = '../train';
dirnameGT = '../improve';
gtTxtFiles = dir(fullfile(dirnameGT,'*.HSV.png')); % Get all .txt files

gt = getGroundTruth(gtTxtFiles, dirname);

MethodX = testBbox(windowCandidates,gt);
