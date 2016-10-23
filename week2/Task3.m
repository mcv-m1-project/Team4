dirname = 'test';
imagefilesA = dir(fullfile([dirname '/A'],'*.png')); % Get all .png files
imagefilesB = dir(fullfile([dirname '/B'],'*.png'))
imagefilesC = dir(fullfile([dirname '/C'],'*.png'))
imagefilesD = dir(fullfile([dirname '/D'],'*.png'))
imagefilesE = dir(fullfile([dirname '/E'],'*.png'))
imagefilesF = dir(fullfile([dirname '/F'],'*.png'))

dirname_new='test';
imagefilesmask = dir(fullfile([dirname_new],'*.png'));

dirname_new=[dirname '/mejora/A'];
[s, mess, messid] = mkdir(dirname_new);
Mejora (imagefilesA, [dirname '/A'], [dirname_new]);

dirname_new=[dirname '/mejora/B'];
[s, mess, messid] = mkdir(dirname_new);
Mejora (imagefilesB, [dirname '/B'], [dirname_new]);

dirname_new=[dirname '/mejora/C'];
[s, mess, messid] = mkdir(dirname_new);
Mejora (imagefilesC, [dirname '/C'], [dirname_new]);

dirname_new=[dirname '/mejora/D'];
[s, mess, messid] = mkdir(dirname_new);
Mejora (imagefilesD, [dirname '/D'], [dirname_new]);

dirname_new=[dirname '/mejora/E'];
[s, mess, messid] = mkdir(dirname_new);
Mejora (imagefilesE, [dirname '/E'], [dirname_new]);

dirname_new=[dirname '/mejora/F'];
[s, mess, messid] = mkdir(dirname_new);
Mejora (imagefilesF, [dirname '/F'], [dirname_new]);


%---------------------------------------------------------------------------------------------------------------
%2nd part
%Realization of the masks for the validation test of the virtual server!

%dirname='test/test/masks';


%imagefilestest = dir(fullfile([dirname],'*.png'));

%dirname_new=[dirname '/mejora'];
%[s, mess, messid] = mkdir(dirname_new);
%Mejora (imagefilestest, [dirname], [dirname_new]);




