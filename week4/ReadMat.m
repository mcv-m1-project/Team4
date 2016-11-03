function [final] = ReadMat()
dirMask = 'onlyTest/singleMatFile/MethodCC';
maskFiles = dir(fullfile(dirMask,'*HSV.png')); % Get all HSV.png files

for k = 1:length(maskFiles)
    toSplit=strsplit(maskFiles(k).name,{'.png'});
    namefiles=toSplit(1);
    namemat = strjoin([namefiles '.mat'],'');
    final{k,1}=namemat;
end

end