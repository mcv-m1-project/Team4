clear all
close all
clc

dirname = 'train';
txtFiles = dir(fullfile([dirname '/gt'],'*.txt')); % Get all .txt files
properties = getProperties(dirname, txtFiles);

area = struct('upTri', max(properties.A(:,1)), 'downTri', max(properties.B(:,1)), 'circle', max([max(properties.C(:,1)), max(properties.D(:,1)), max(properties.E(:,1))]),'square', max(properties.F(:,1)));
form_factor = struct('upTri', mean(properties.A(:,2)), 'downTri', mean(properties.B(:,2)), 'circle', mean([mean(properties.C(:,2)), mean(properties.D(:,2)), mean(properties.E(:,2))]),'square', mean(properties.F(:,2)));

%%

% BW, Color, Gray
[template_bw,template_color,template_gray,template_edge] = createTemplate(dirname, txtFiles, area, form_factor, properties);

%%
% Plot Up Triangle
figure;
subplot(2,2,1)
imshow(double(template_bw.upTri));
subplot(2,2,2)
imshow(template_color.upTri)
subplot(2,2,3)
imshow(template_gray.upTri)
subplot(2,2,4)
imshow(template_edge.upTri)

%%
% Plot Down Triangle
figure;
subplot(2,2,1)
imshow(double(template_bw.downTri));
subplot(2,2,2)
imshow(template_color.downTri)
subplot(2,2,3)
imshow(template_gray.downTri)
subplot(2,2,4)
imshow(template_edge.downTri)

%%
% Plot Circle
figure;
subplot(2,2,1)
imshow(double(template_bw.circle));
subplot(2,2,2)
imshow(template_color.circle)
subplot(2,2,3)
imshow(template_gray.circle)
subplot(2,2,4)
imshow(template_edge.circle)

%%
% Plot Square
figure;
subplot(2,2,1)
imshow(double(template_bw.square));
subplot(2,2,2)
imshow(template_color.square)
subplot(2,2,3)
imshow(template_gray.square)
subplot(2,2,4)
imshow(template_edge.square)
