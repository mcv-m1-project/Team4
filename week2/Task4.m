%% -------------------  Task 4 (Week2) -------------------  %%
clc;
clear all;
close all;
                                  
dirname = '/Users/Toni/Desktop/Toni/Master/M1/ProjectMaterials/Week 1/Code/train';
txtFiles = dir(fullfile([dirname '/gt'],'*.txt')); % Get all .txt files
maskFiles = dir(fullfile([dirname '/mask'],'*.png')); % Get all .png files

[sABC, sDF, sE] = getParameters(txtFiles, maskFiles, dirname);

Histogram2D_ABC = createHistogram(sABC, dirname, 'ABC');
Histogram2D_DF = createHistogram(sDF, dirname, 'DF');
Histogram2D_E = createHistogram(sE, dirname, 'E_img');

= HistogramBackProjection(struct,dirname,dirname_new)
= HistogramBackProjection(struct,dirname,dirname_new)
= HistogramBackProjection(struct,dirname,dirname_new)

% Histogram Backprojection
figure;
bar3(Histogram2D);

Histogram2D = Histogram2D/sum(Histogram2D);
figure;
bar3(Histogram2D);

