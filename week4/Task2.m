clear all
close all
clc

dirname = 'mejora';
maskFiles = dir(fullfile(dirname,'*.png'));
%txtFiles = dir(fullfile([dirname '/gt/'],'*.txt'));
load('template_edge.mat');
chamfer(dirname,maskFiles,template_edge);