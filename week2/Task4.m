%% -------------------  Task 4 (Week2) -------------------  %% part1
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


Histogram2D_ABC(1,1)= 0;
Histogram2D_DF(1,1)= 0;
Histogram2D_E(1,1)= 0;



HistogramBackProjection(sABC,[dirname '/'],nbins,'ABC',Histogram2D_ABC)
HistogramBackProjection(sDF,[dirname '/'],nbins,'DF',Histogram2D_DF)
HistogramBackProjection(sE,[dirname '/'],nbins,'E',Histogram2D_E)

%%
%---------------------------------------------------------------------------------------------------------------
%2nd part
%Realization of the masks for the validation test of the virtual server!

%clc;
%clear all;
%close all;
                                  
%dirname = 'train';
%txtFiles = dir(fullfile([dirname '/gt'],'*.txt')); % Get all .txt files
%maskFiles = dir(fullfile([dirname '/mask'],'*.png')); % Get all .png files
%nbins=[100,100];

%[sABC, sDF, sE] = getParameters(txtFiles, maskFiles, dirname);

%Histogram2D_ABC = createHistogram(sABC, dirname, 'ABC',nbins);
%Histogram2D_DF = createHistogram(sDF, dirname, 'DF',nbins);
%Histogram2D_E = createHistogram(sE, dirname, 'E_img',nbins);

%Histogram2D_ABC(1,1)= 0;
%Histogram2D_DF(1,1)= 0;
%Histogram2D_E(1,1)= 0;

%dirname='test/test/Images';
%imagefilestest = dir(fullfile([dirname],'*.jpg'));

%HistogramBackProjectionTest(imagefilestest,[dirname '/'],nbins,'ABC',Histogram2D_ABC)
%HistogramBackProjectionTest(imagefilestest,[dirname '/'],nbins,'DF',Histogram2D_DF)
%HistogramBackProjectionTest(imagefilestest,[dirname '/'],nbins,'E',Histogram2D_E)

