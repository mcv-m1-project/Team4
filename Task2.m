train_split_A = round(0.7*length(A));
train_split_B = round(0.7*length(B));
train_split_C = round(0.7*length(C));
train_split_D = round(0.7*length(D));
train_split_E = round(0.7*length(E));
train_split_F = round(0.7*length(F));
total_train_split = train_split_A + train_split_B + train_split_C + train_split_D + train_split_E + train_split_F;

cert = total_train_split/total_signal;

dirname = '/Users/Toni/Desktop/Toni/Master/ProjectMaterials/Week 1/Code/train/gt';
dirname_new = '/Users/Toni/Desktop/Toni/Master/ProjectMaterials/Week 1/Code/train/train_split';   
dirname_validation = '/Users/Toni/Desktop/Toni/Master/ProjectMaterials/Week 1/Code/train/validation_split'; 
dirname_images = '/Users/Toni/Desktop/Toni/Master/ProjectMaterials/Week 1/Code/train';

for i = 1:train_split_A
    file_tA = fullfile(dirname, A{i,2});
    copyfile(file_tA, dirname_new); % copying txt files at new diretory train_split   
end

for i = 1:train_split_B
    file_tB = fullfile(dirname, B{i,2});
    copyfile(file_tB, dirname_new); % copying txt files at new diretory train_split 
end

for i = 1:train_split_C
    file_tC = fullfile(dirname, C{i,2});
    copyfile(file_tC, dirname_new); % copying txt files at new diretory train_split   
end

for i = 1:train_split_D
    file_tD = fullfile(dirname, D{i,2});
    copyfile(file_tD, dirname_new); % copying txt files at new diretory train_split
end

for i = 1:train_split_E
    file_tE = fullfile(dirname, E{i,2});
    copyfile(file_tE, dirname_new); % copying txt files at new diretory train_split   
end

for i = 1:train_split_F
    file_tF = fullfile(dirname, F{i,2});
    copyfile(file_tF, dirname_new); % copying txt files at new diretory train_split
end