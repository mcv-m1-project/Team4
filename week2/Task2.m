
dirname='C:\Users\media\Desktop\Master\M1 - Practicas\Practica 1\Datos\train_2016\train';

imagefiles=dir(fullfile([dirname],'*.jpg'));
se=ones(3,3);


for i=1:10
    %im1=imagefiles(i).name;
    im1=imread(fullfile([dirname],imagefiles(i).name));
    im2=rgb2gray(im1);
    
    tic
    im3=imdilate(im2,se);
    Total_Time(i)=toc;
    
    tic
    im4=mydilategray(im2,se);
    Total_Time_my(i)=toc;
    
end
mean1=mean(Total_Time);
mean2=mean(Total_Time_my)
    