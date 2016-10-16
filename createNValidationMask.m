function createNValidationMask(struct, dirname, dirname_new, pixel_method)
    % createNValidationMask
    % Generate a mask for New and save each mask in a new directory
    %
    %    Parameter name      Value
    %    --------------      -----
    %    'struct'           Matrix struct of A, B, C, D, E or F type
    %    'dirname'          Current directory of each struct signl type
    %    'dirname_new'      New directory to copy the new split array
    
    dirname_new = ['validation_split/mask/' dirname_new];
    [s, mess, messid] = mkdir(dirname_new);
    j = ( length(struct) - round(0.3*length(struct)) ) + 1;

    for i = j:length(struct)
        toSplit = strsplit(struct{i}.name,{'gt.','.txt'}); %struct{i}.name
        im = imread(fullfile(dirname, strjoin([toSplit(2) '.jpg'],'')));
        switch pixel_method
            
            case 'RGB-LUM'
            % Normalizing RGB image
            % https://es.mathworks.com/matlabcentral/newsreader/view_thread/171190
            % Converting an RGB image into normalized RGB removes the effect of any intensity variations.

            im = double(im);

            Image_red = im(:,:,1); % channel red
            Image_green = im(:,:,2); % channel green
            Image_blue = im(:,:,3); % channel blue;


            [row,col] = size(im(:,:,1)); % Get dimensions

            for y = 1:row % numberof rows in image
                for x = 1:col % number of columns in the image
                    Red = Image_red(y,x); % Value of every pixel
                    Green = Image_green(y,x);
                    Blue = Image_blue(y,x);

                    NormalizedRed = Red/sqrt(Red^2 + Green^2 + Blue^2); %Normalize
                    NormalizedGreen = Green/sqrt(Red^2 + Green^2 + Blue^2);
                    NormalizedBlue = Blue/sqrt(Red^2 + Green^2 + Blue^2);

                    Image_red(y,x) = NormalizedRed;
                    Image_green(y,x) = NormalizedGreen;
                    Image_blue(y,x) = NormalizedBlue;
               end
            end

            im(:,:,1) = Image_red;
            im(:,:,2) = Image_green;
            im(:,:,3) = Image_blue;

            %Segmentation part
            im_R = Image_red; % channel red
            im_G = Image_green; % channel green
            im_B = Image_blue; % channel blue

            % Otsu's Method: 
            thresh_R = multithresh(im_R,3);
            thresh_G = multithresh(im_G,3); 
            thresh_B = multithresh(im_B,3); 

            % RGB Space with Multithresh
            red1 = (im_R > thresh_R(3)) & (im_B < thresh_B(2)) & (im_G < thresh_G(2)); % red mask
            blue1 = (im_R < thresh_R(2)) & (im_B > thresh_B(3)) & (im_G < thresh_G(2)); % blue mask          
            
            % RGB Space with Fixed Threshold
            % red1 = (im_R > 0.7) & (im_B < 0.55) & (im_G < 0.55); % red mask
            % blue1 = (im_R < 0.55) & (im_B > 0.7) & (im_G < 0.55); % blue mask

            mask_rgb = red1 | blue1; 

%             figure(1)
%             imshow(mask_rgb);
            
            imwrite(mask_rgb, strjoin([dirname_new '/mask.' toSplit(2) '.RGB-LUM.png'],''));
        end   
    end
end