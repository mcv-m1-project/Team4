

dirname = 'train';
maskFiles = dir(fullfile(dirname ,'*.png'));
load('template_edge.mat');
chamfer(maskFiles,template_edge);
