clear all
close all
clc
dirname = 'train';
txtFiles = dir(fullfile([dirname '/gt'],'*.txt')); % Get all .txt files
[propA, propB, propC, propD, propE, propF] = getProperties(dirname, txtFiles);

size = struct('upTri', max(propA(:,1)), 'downTri', max(propB(:,1)), 'circle', max([max(propC(:,1)), max(propD(:,1)), max(propE(:,1))]),'square', max(propF(:,1)));
form_factor = struct('upTri', mean(propA(:,2)), 'downTri', mean(propB(:,2)), 'circle', mean([mean(propC(:,2)), mean(propD(:,2)), mean(propE(:,2))]),'square', mean(propF(:,2)));

gt = getGroundTruth(txtFiles, dirname);
% UpTri
createTemplate(dirname, size.upTri, form_factor.upTri)

%DownTri
createTemplate(dirname, size, form_factor)

%Circle
createTemplate(dirname, size, form_factor)

%Square
createTemplate(dirname, size, form_factor)
