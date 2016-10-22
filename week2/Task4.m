%% -------------------  Task 4 (Week2) -------------------  %%
clc;
clear all;
close all;
                                  
dirname = 'train';
txtFiles = dir(fullfile([dirname '/gt'],'*.txt')); % Get all .txt files
maskFiles = dir(fullfile([dirname '/mask'],'*.png')); % Get all .png files
nbins=[100,100];

[sABC, sDF, sE] = getParameters(txtFiles, maskFiles, dirname);

Histogram2D_ABC = createHistogram(sABC, dirname, 'ABC',nbins);
Histogram2D_DF = createHistogram(sDF, dirname, 'DF',nbins);
Histogram2D_E = createHistogram(sE, dirname, 'E_img',nbins);

HistogramBackProjection(sABC,[dirname '/'],nbins,'ABC',Histogram2D_ABC)
HistogramBackProjection(sDF,[dirname '/'],nbins,'DF',Histogram2D_DF)
HistogramBackProjection(sE,[dirname '/'],nbins,'E',Histogram2D_E)

% Histogram Backprojection
%figure;
%bar3(Histogram2D);

%Histogram2D = Histogram2D/sum(Histogram2D);
%figure;
%bar3(Histogram2D);
