close all
clear all
clc

dirTxt = '../train';
w = getWindowSize(dirTxt); % Get Optimal Width and Height using TxtFiles

w_width = w;
w_height = w;

window = zeros(w_height,w_width);
window_area = w_height*w_width;
dirMask = '../mejora';
maskFiles = dir(fullfile(dirMask,'*HSV.png')); % Get all .png files
w_position = cell(length(maskFiles),1);

tic
for k = 1:3 %length(maskFiles)
    w_pos = [0, 0, 0, 0];
    im = imread(fullfile(dirMask,maskFiles(k).name)); % read the image
    im_width = size(im,2);
    im_height = size(im,1);

    d = 1;
    imfilt = conv2(ones(w),im);
    
    for i=1:im_width
        for j=1:im_height
            if (imfilt(i,j) > 0.4 && imfilt(i,j) < 0.6) || (imfilt(i,j) > 0.7 && imfilt(i,j) < 0.85) || (imfilt(i,j) > 0.9 && imfilt(i,j) <= 1)
            
            w_position{k}(d,:) = [j,i,w_height,w_width];
            w_pos(d,:) = [j,i,w_width,w_height];
            d = d + 1;
            end
        end
    end
    if isempty(w_pos)
        w_pos = [0, 0, 0, 0];
        disp('Empty');
    else
    
    
%     if (~isempty(w_position{k}))
%         [unic, ia] = unique(w_position{k}(:,1));
%         % freq = [unic,histc(w_position(:,1),unic)];
%         w_position{k} = w_position{k}(ia,:);
%         w_position{k} = w_position{k}(1:10:end,:);

        [unic, ia] = unique(w_pos(:,1)); % x vector
        w_pos = w_position{2};
        w_pos = w_pos(ia,:);
        w_pos = w_pos(1:10:end,:);
    end
end

timeTask5 = toc;

%% Result: List Of Bounding Boxes containing a detection

% save as .mat file
save windowCandidates