%% ====================== Task 3 (Week 4) ====================== %%

clear all
close all
clc

dirnameGT = 'Validation Train'; % Dirname of the Validation Train files 
gtTxtFiles = dir(fullfile(dirnameGT,'*.HSV.png')); % Get all .png files

dirname = 'train'; % Dirname of the Train files
gt = getGroundTruth(gtTxtFiles,dirname); % Get the Ground Truth of the files 

% Calculate the variables TP, FN, FP, Precision, Sensitivity, Accuracy and
% F1 of the methods in Task 1 and Task 2
MethodCCandCorrelation = testBbox(gtTxtFiles,gt,dirnameGT); % Method of the Task 1
MethodDT = testBbox(gtTxtFiles,gt,dirnameGT); % Method of the Task 2