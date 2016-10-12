function copySplitFile(struct, train_split, dirname, dirname_new)
    % copySplitFile
    % Split and separate each signal type cell array in a new directory
    %
    %    Parameter name      Value
    %    --------------      -----
    %    'cellArray'        Matrix cell array of A, B, C, D, E or F type
    %    'train_split'      Lenght of each split matrix for validation test (70%)
    %    'dirname'          Current directory of each cell array
    %    'dirname_copy'     New directory to copy the new split array
    
    dirname_new = ['train_split/' dirname_new];
    [s, mess, messid] = mkdir(dirname_new);

    if s % status 1 => folder created
        for i = 1:train_split
            txtSplit = fullfile([dirname '/gt'], struct{i}.name);
            toSplit = strsplit(struct{i}.name,{'gt.','.txt'}); % toSplit-> (1)'gt.' (2)'name' (3)'.txt'
            imgSplit = fullfile(dirname, strjoin([toSplit(2) '.jpg'],''));
            maskSplit = fullfile([dirname '/mask'], strjoin(['mask.' toSplit(2) '.png'],''));
            
%             txtSplit, imgSplit, maskSplit
%             pause()
            copyfile(txtSplit, dirname_new); % copy txt files at new diretory train_split
            copyfile(imgSplit, dirname_new); % copy img files at new diretory train_split
            copyfile(maskSplit, dirname_new); % copy mask files at new diretory train_split
        end
        disp(['Folder created successfully (' pwd '/' dirname_new ')']);
    else
        disp(['Can not create folder: ' pwd '/' dirname_new]);
    end
end