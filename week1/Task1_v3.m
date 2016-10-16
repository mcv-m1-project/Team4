%% -------------------  Task 1  -------------------  %%
clc;
clear all;
close all;
                                  
dirname = 'train';
txtFiles = dir(fullfile([dirname '/gt'],'*.txt')); % Get all .txt files
maskFiles = dir(fullfile([dirname '/mask'],'*.png')); % Get all .png files

[sA, sB, sC, sD, sE, sF] = getParameters(txtFiles, maskFiles, dirname);