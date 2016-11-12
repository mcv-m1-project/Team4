function [maskFiles] = ReadImage()
dirMask = 'Validation train img';
maskFiles = dir(fullfile(dirMask,'*.jpg')); % Get all .jpg files
end