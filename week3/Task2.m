close all
clear all
clc

dirTxt = 'train';
w = getWindowSize(dirTxt); % Get Optimal Width and Height using TxtFiles

w_width = w;
w_height = w;

window = zeros(w_height,w_width);
window_area = w_height*w_width;
dirMask = 'mejora';
maskFiles = dir(fullfile(dirMask,'*HSV.png')); % Get all .png files
w_position = cell(length(maskFiles),1);

tic
for k = 1:length(maskFiles)

im = imread(fullfile(dirMask,maskFiles(k).name)); % read the image
im_width = size(im,2);
im_height = size(im,1);

d = 1;
for i = 1:(im_height - w_height)
    for j = 1:(im_width - w_width)
        window = im(i:i + (w_height - 1), j:j + (w_width - 1));
        signal_area = sum(sum(window));
        %bbox_area = boundingboxes(k,3).*(boundingboxes(k,4));
        fr = signal_area / window_area;
        %if fr > 0.5
        if (fr > 0.4 && fr < 0.6) || (fr > 0.7 && fr < 0.85) || (fr > 0.9 && fr <= 1)
            % w_signal{d} = window;
            w_position{k}(d,:) = [j,i,w_height,w_width];
            d = d + 1;
        end
    end
end

if (~isempty(w_position{k}))
    [unic, ia] = unique(w_position{k}(:,1));
    % freq = [unic,histc(w_position(:,1),unic)];
    w_position{k} = w_position{k}(ia,:);
    w_position{k} = w_position{k}(1:10:end,:);
end
end
timeTask2 = toc;
% dd = 1;
% delete = 0;
% for i = 1:(length(w_position) - 1)
%     if w_position(i,2) == w_position((i+1),2) % || (w_position(i,2) <= (w_position((i+1),2) + 30))  
%         delete(dd) = i;
%         dd = dd + 1;  
%     end
% end

% w_position(delete,:) = []; % delete boxes

%% Result: List Of Bounding Boxes containing a detection

% save as .mat file
save w_position

%% Plot of the image and all the boxes

for k = 1:length(maskFiles)
    imshow(imread(fullfile(dirname1,maskFiles(k).name)));
    hold on
    for d = 1:length(w_position{k,1})
        rectangle('position',w_position{k}(d,:),'Edgecolor','g')
    end
    pause();
end

%% Plot of the image and only one box

imshow(im);
hold on
rectangle('position',w_position(1,:),'Edgecolor','g')
  