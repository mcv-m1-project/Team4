%% ====================== Task 3 (Week 3) ====================== %%

close all
clear all
clc

dirTxt = '../train';
dirMask = '../mejora';

w = getWindowSize(dirTxt); % Get Optimal Width and Height using TxtFiles
w_width = w;
w_height = w;

window = zeros(w_height,w_width);
window_area = w_height*w_width;

maskFiles = dir(fullfile(dirMask,'*HSV.png')); % Get all HSV.png files
i_position = cell(length(maskFiles),1); % Preallocate Memory for a Cell Array

tic
for k = 1:length(maskFiles)
    w_pos = [0, 0, 0, 0];
    im = imread(fullfile(dirMask,maskFiles(k).name)); % read each image
    im_width = size(im,2);
    im_height = size(im,1);
    
    %inte = integralImage(im);
    inte2 = cumsum(cumsum(double(im)),2);

    d = 1;
    for i = 1:(im_height - w_height)
        for j = 1:(im_width - w_width)
            window = im(i:i + (w_height - 1), j:j + (w_width - 1));

            %regionSum = inte(i+w+h,j+w-h+1) + inte(i,j+1) - inte(i+h,j-h+1) - inte(i+w,j+w+1);
            regionSum = inte2(i+w_height-1,j+w_width-1) + inte2(i,j) - inte2(i,j+w_width-1) - inte2(i+w_height-1,j);

            fr = regionSum / window_area;
            
            if (fr > 0.4 && fr < 0.6) || (fr > 0.7 && fr < 0.85) || (fr > 0.9 && fr <= 1)
                % i_position{k}(d,:) = [j, i, w_height, w_width];
                w_pos(d,:) = [j,i,w_width,w_height];
                d = d + 1;
            end
        end
    end
    
    if isempty(w_pos)
        w_pos = [0, 0, 0, 0];
        disp('Empty');
    else
        [unic, ia] = unique(w_pos(:,1)); % x vector
        w_pos = w_pos(ia,:);
        w_pos = w_pos(1:10:end,:);
    end
    k
    
    windowCandidates(k,:) = struct('x', w_pos(:,1), 'y' , w_pos(:,2), 'w', w_pos(:,3), 'h', w_pos(:,4));
    clear w_pos

    
%     if (~isempty(i_position{k}))
%         % Get a new windows with Non-Repetitive TopLeft(x,y)
%         [unic, ia] = unique(i_position{k}(:,1));
%         
%         % freq = [unic,histc(w_position(:,1),unic)];
%         i_position{k} = i_position{k}(ia,:);
%         i_position{k} = i_position{k}(1:10:end,:); % Only keep a few calulcated windows
%     end
    
end
timeTask3 = toc;


%% Result: List Of Bounding Boxes containing a detection

% save as .mat file
save windowCandidates

%% Plot of the image and all the boxes

for i = 1:length(maskFiles)
    imshow(imread(fullfile(dirMask,maskFiles(i).name))); %Plot the image and the boxes
    
    hold on
    for j = 1:length(windowCandidates(i).x)
        rectangle('position',[windowCandidates(i).x(j), windowCandidates(i).y(j), windowCandidates(i).w(j), windowCandidates(i).h(j)],'Edgecolor','g')
    end
    pause();
end