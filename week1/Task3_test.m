dirname = 'test';
imagefiles = dir(fullfile([dirname],'*.jpg')); % Get all .png files
dirname_new='test'


createValidationMasktest(imagefiles,dirname,dirname_new,'RGB')
createValidationMasktest(imagefiles,dirname,dirname_new,'HSV')
createValidationMasktest(imagefiles,dirname,dirname_new,'Lab')
createValidationMasktest(imagefiles,dirname,dirname_new,'RGB-LUM')
