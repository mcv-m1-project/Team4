%% -------------------  Task 4  -------------------  %%
clc;
clear all;
close all;
                                  
dirname = '../train';
txtFiles = dir(fullfile([dirname '/gt'],'*.txt')); % Get all .txt files
maskFiles = dir(fullfile([dirname '/mask'],'*.png')); % Get all .png files

[sABC, sDF, sE] = getParameters(txtFiles, maskFiles, dirname);