%% ====================== Task 4 (Week 3) ====================== %%
clear all;
close all;
clc

dirname = '../train';
txtFiles = dir(fullfile([dirname '/gt'],'*.txt')); % Get all .txt files

t = getGroundTruth(txtFiles, dirname);