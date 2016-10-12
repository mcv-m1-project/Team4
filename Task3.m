im = imread('/Users/Toni/Desktop/Toni/Master/ProjectMaterials/Week 1/Code/train/00.001147.jpg'); % read the image

dirname = '/Users/Toni/Desktop/Toni/Master/ProjectMaterials/Week 1/Code/Task1/train_split';
dirname_new = ['/Users/Toni/Desktop/Toni/Master/ProjectMaterials/Week 1/Code/Task1/train_split/mask' ];
[s, mess, messid] = mkdir(dirname_new);

createMask(A, train_split_A, [dirname '/A'], 'A');
createMask(B, train_split_B, [dirname '/B'], 'B');
createMask(C, train_split_C, [dirname '/C'], 'C');
createMask(D, train_split_D, [dirname '/D'], 'D');
createMask(E, train_split_E, [dirname '/E'], 'E');
createMask(F, train_split_F, [dirname '/F'], 'F');

