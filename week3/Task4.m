%% ====================== Task 4 (Week 3) ====================== %%

dirname = 'train';
dirnameGT = 'mejora';
gtTxtFiles = dir(fullfile(dirnameGT,'*.HSV.png')); % Get all .txt files
% txtFiles = dir(fullfile([dirname '/gt'],'*.txt')); % Get all .txt files

gt = getGroundTruth(gtTxtFiles, dirname);

MethodCC = testBbox(CCboxes,gt);
%MethodSW = testBbox(w_position,gt);
%MethodII = testBbox(i_position,gt);


