dirname='/Users/Toni/Desktop/Toni/Master/ProjectMaterials/Week 1/Code/train';

imagefiles=dir(fullfile([dirname],'*.jpg'));
se=ones(3,3);


for i = 1:10

    im = imread(fullfile([dirname],imagefiles(i).name));
    img = rgb2gray(im);
    
    tic
    im = imdilate(img,se);
    Total_Time_D(i) = toc;
    
    tic
    im = mydilategray(img,se);
    Total_Time_myD(i) = toc;
    
    tic
    im = imerode(img,se);
    Total_Time_E(i) = toc;
    
    tic
    im = myerosiongray(img,se);
    Total_Time_myE(i) = toc;
    
    tic
    im = imopen(img,se);
    Total_Time_O(i) = toc;
    
    tic
    im = myOpening(img,se);
    Total_Time_myO(i) = toc;
  
    tic
    im = imclose(img,se);
    Total_Time_C(i) = toc;
    
    tic
    im = myClosing(img,se);
    Total_Time_myC(i) = toc;
          
    tic
    im = imtophat(img,se);
    Total_Time_TH(i) = toc;
    
    tic
    im = myTopHat(img,se);
    Total_Time_myTH(i) = toc;

    tic
    im = imbothat(img,se);
    Total_Time_DTH(i) = toc;
    
    tic
    im = myDualTopHat(img,se);
    Total_Time_myDTH(i) = toc;
   
end

mean_D = mean(Total_Time_D);
mean_myD = mean(Total_Time_myD);

mean_E = mean(Total_Time_E);
mean_myE = mean(Total_Time_myE);

mean_O = mean(Total_Time_O);
mean_myO = mean(Total_Time_myO);

mean_C = mean(Total_Time_C);
mean_myC = mean(Total_Time_myC);

mean_TH = mean(Total_Time_TH);
mean_myTH = mean(Total_Time_myTH);

mean_DTH = mean(Total_Time_DTH);
mean_myDTH = mean(Total_Time_myDTH);
   