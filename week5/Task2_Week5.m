%% ====================== Task 1 (Week 5) ====================== %%
% UCM
clear all 
close all
clc

addpath('MCG-PreTrained')

% root_dir = '';
% install

% READ
dirname = 'Validation';
dirnameUCM = 'UCM_TestSegImages';

% WRITE
dirWriteMask = 'WriteMask';
dirWriteMat = 'TestMatNew';

imgFiles = dir(fullfile(dirname,'*.jpg')); % Get all the images
ucmFiles = dir(fullfile(dirnameUCM,'*.mat')); % Get all the images

% Laod Template
load('template_bw.mat');

if ~exist(dirWriteMask, 'dir')
    mkdir(dirWriteMask);
end
if ~exist(dirWriteMat, 'dir')
    mkdir(dirWriteMat);
end

% r = {};
% c = {};
% for i = 1:length(u)
%     [r{i,1},c{i,1}] = find(seg == u(i));
%     area(i,1) = length(r{i,1})/(size(;
% end
% 
% area = mean(l)/(s;

se1 = ones(5,5);
se2 = ones(8,8);
template_bw.square = imdilate(double(template_bw.square),se1);
template_bw.square = imfill(template_bw.square,'holes');
template_bw.square = imopen(template_bw.square,se2);

for f = 1:length(imgFiles)    
    [pathstr_i, name_i, ext_i]=fileparts(ucmFiles(f).name);
    seg = load([dirnameUCM, '/' name_i, '.mat']);
    seg = seg.seg; % From load UCMSegImages
    % seg = segment_ucm(ima, 0.8);
    u = unique(seg);
    d = 1; dd = 1;
    Mask = false([size(seg,1) size(seg,2)]);
    for i = 1:length(u) 
        BW=(seg==i);
        % BW=seg(:,:,1);
        stats = regionprops(BW,'BoundingBox','Extent','Orientation','ConvexArea'); %,'Solidity');
        boundingboxes = cat(1,stats.BoundingBox);
        fr = cat(1,stats.Extent);
        perc = ( (stats.ConvexArea) ./ (size(BW,1)*size(BW,2)) ) * 100;
        orientation = stats.Orientation;
        % solidity = stats.Solidity
        if ((perc > 0.05) && (perc < 2) ) % && (orientation > -17) && (orientation < 17))
            for k = 1:size(boundingboxes,1)
                ratio(k) = boundingboxes(k,3) ./ boundingboxes(k,4);
                if ((fr(k) > 0.4 && fr(k) <= 1.1)) && ((boundingboxes(k,3) > 40) || (boundingboxes(k,4) > 40)) && ((ratio(k) > 0.65) && (ratio(k) < 1.3))        
                    w_pos(d,:) = [boundingboxes(1),boundingboxes(2),boundingboxes(3),boundingboxes(4)];
                    
                    % figure(1);imshow(BW);pause();
                    
                    x1 = w_pos(d,1);
                    y1 = w_pos(d,2);
                    w = w_pos(d,3);
                    h = w_pos(d,4);

                    if x1~=0 && y1~=0 && w~=0 && h~=0
                        I = imcrop(BW,[x1 y1 w h]);
                        
                        I2 = imdilate(I,se1);
                        I3 = imfill(I2,'holes');
                        I = imopen(I3,se2);

                        upTriresize = imresize(double(template_bw.upTri), size(I));
                        rupTri = corr2(upTriresize,I);
                        downTriresize = imresize(double(template_bw.downTri), size(I));
                        rdownTri = corr2(downTriresize,I);
                        circleresize = imresize(double(template_bw.circle),size(I));
                        rcircle = corr2(circleresize,I);
                        squareresize = imresize(double(template_bw.square), size(I));
                        rsquare = corr2(squareresize,I); 
                    else
                        rupTri=0;
                        rdownTri=0;
                        rcircle=0;
                        rsquare=0;
                    end

                    if isnan(rcircle) 
                        rcircle=0;
                    end
                    if isnan(rsquare) 
                        rsquare=0;
                    end
                    if isnan(rdownTri) 
                        rdownTri=0;
                    end
                    if isnan(rupTri) 
                        rupTri=0;
                    end

                    % MatchingTemplate
                    if ( rupTri>0.6 || rdownTri>0.6 || rcircle>0.6 || rsquare>0.09 )  
                        % Save new windowsCandidates
                        CCBoxes(dd,1) = struct('x', x1, 'y' , y1, 'w', w, 'h', h);
                        Mask = Mask | logical(BW);
                        dd = dd + 1;
                    end
                    d = d + 1;
                end
            end % Enf for BB from CCL stats 
        end % End Prec Orient ...
    end % End length each img (u)
    
    if ~exist('w_pos')
        w_pos = [0, 0, 0, 0];
    end
    if ~exist('CCBoxes')
        CCBoxes = struct('x', 0, 'y' , 0, 'w', 0, 'h', 0);
        Mask = Mask | logical(BW);
    elseif length(w_pos) == 1
        CCBoxes = struct('x', x1, 'y' , y1, 'w', w, 'h', h);
        Mask = Mask | logical(BW);
    end
%     z = 1;
%     
%     if(isempty(w_pos))
%         w_pos(z,:) = struct( 'x', 0, ... 
%                'y', 0, ... 
%                'w', 0, ... 
%                'h', 0);
%     end

    % CCBoxes(:,1) = struct('x', w_pos(:,1), 'y' , w_pos(:,2), 'w', w_pos(:,3), 'h', w_pos(:,4));     
    
    % w_pos temp for plot
    tCCBoxes(:,1) = struct('x', w_pos(:,1), 'y' , w_pos(:,2), 'w', w_pos(:,3), 'h', w_pos(:,4)); 
    clear w_pos
    j = 1; 

    clear windowCandidates
    while j<=length(CCBoxes) % for each windowCanidate         
        windowCandidates(j,1) = struct('x', CCBoxes(j).x, 'y', CCBoxes(j).y, 'w', CCBoxes(j).w, 'h', CCBoxes(j).h);
        j = j + 1;   
    end
    
    [pathstr_r, name_r, ext_r] = fileparts(imgFiles(f).name);
	save ([dirWriteMat '/', name_r, '.mat'], 'windowCandidates');
    imwrite(Mask, [dirWriteMask '/' name_r '.png']);
    f
    
    % ==== BEGIN PLOT ====
%     figure(1); 
%     imshow(imread(fullfile('UCM_Images/',imgFiles(f).name)));
%     hold on 
%     for j = 1:length(tCCBoxes.x)   
%         rectangle('position',[tCCBoxes.x(j), tCCBoxes.y(j), tCCBoxes.w(j), tCCBoxes.h(j)],'Edgecolor','g') %  
%     end
%     
%     for j = 1:length(CCBoxes)   
%         %rectangle('position',[tWin(j).x, windowCandidates(j).y, windowCandidates(j).w, windowCandidates(j).h],'Edgecolor','g') %    
%         rectangle('position',[CCBoxes(j).x, CCBoxes(j).y, CCBoxes(j).w, CCBoxes(j).h],'Edgecolor','r')  
%     end
%     pause();
    % ==== END PLOT ====
    
    clear CCBoxes tCCBoxes Mask
end