%% ====================== Task 2 (Week 3) ====================== %%

close all
clear all
clc

dirTxt = '../train';
dirMask = '../HSV';

w = getWindowSize(dirTxt); % Get Optimal Width and Height using TxtFiles

w_width = w;
w_height = w;

window = zeros(w_height,w_width);
window_area = w_height*w_width;

maskFiles = dir(fullfile(dirMask,'*HSV.png')); % Get all .png files

tic
for k = 1:length(maskFiles)
    w_pos = [0, 0, 0, 0];
    im = imread(fullfile(dirMask,maskFiles(k).name)); % read the image
    im_width = size(im,2);
    im_height = size(im,1);

    d = 1;
    for i = 1:(im_height - w_height)
        for j = 1:(im_width - w_width)
            window = im(i:i + (w_height - 1), j:j + (w_width - 1));
            signal_area = sum(sum(window));
            fr = signal_area / window_area;

            if (fr > 0.4 && fr < 0.6) || (fr > 0.7 && fr < 0.85) || (fr > 0.9 && fr <= 1)
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
    k
    
    windowCandidates(k,:) = struct('x', w_pos(:,1), 'y' , w_pos(:,2), 'w', w_pos(:,3), 'h', w_pos(:,4));
    clear w_pos
    
end
timeTask2 = toc;

%% Save as .mat File
save windowCandidates

%% Plot of the image and all the boxes
% for k = 1:length(maskFiles)
%     imshow(imread(fullfile(dirname1,maskFiles(k).name)));
%     hold on
%     for d = 1:length(w_position{k,1})
%         rectangle('position',w_position{k}(d,:),'Edgecolor','g')
%     end
%     pause();
% end
% imshow(im);
% hold on
% rectangle('position',w_position(1,:),'Edgecolor','g')
  
