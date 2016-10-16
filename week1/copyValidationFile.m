function copyValidationFile(struct, dirname, dirname_new)
    % copyValidationFile
    % Split and separate each signal type for the Validation Test in a new directory
    %
    %    Parameter name      Value
    %    --------------      -----
    %    'struct'           Matrix struct of A, B, C, D, E or F type
    %    'dirname'          Current directory of each struct signal type
    %    'dirname_new'      New directory to copy the new split array
    
    dirname_new = ['validation_split/' dirname_new];
    [s, mess, messid] = mkdir(dirname_new);
    j = ( length(struct) - round(0.3*length(struct)) ) + 1;
    
    if s % status 1 => folder created
        for i = j:length(struct)
            txtSplit = fullfile([dirname '/gt'], struct{i}.name);
            toSplit = strsplit(struct{i}.name,{'gt.','.txt'}); % toSplit-> (1)'gt.' (2)'name' (3)'.txt'
            imgSplit = fullfile(dirname, strjoin([toSplit(2) '.jpg'],''));
            maskSplit = fullfile([dirname '/mask'], strjoin(['mask.' toSplit(2) '.png'],''));
            
            copyfile(txtSplit, dirname_new); % copy txt files at new diretory
            copyfile(imgSplit, dirname_new); % copy img files at new diretory
            copyfile(maskSplit, dirname_new); % copy mask files at new diretory
        end
        disp(['Folder created successfully (' pwd '/' dirname_new ')']);
    else
        disp(['Can not create folder: ' pwd '/' dirname_new]);
    end
end