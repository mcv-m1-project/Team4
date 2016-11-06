clear all
close all
clc

dirname = 'HSV';
maskFiles = dir(fullfile(dirname,'*.png'));
txtFiles = dir(fullfile([dirname '/gt/'],'*.txt'));
load('template_edge.mat');
w_pos = chamfer(dirname,maskFiles,template_edge);

