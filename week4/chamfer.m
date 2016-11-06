function w_pos = chamfer(dirname,maskFiles,template_edge)
% B -> maskFiles
% T -> templatge_edge
w_pos = [];
load('template_bw.mat');
%prepare circles
CircleSizes = round(linspace(150,300,7));
for p = 1:length(CircleSizes)
    circleedge{p} = CreateCircles(CircleSizes(p));
end

%prepare up triangles
temptriup = double(template_bw.upTri);

for l = 1:7
    sub = 0.3*l;
    triupe{l} = imresize(temptriup,sub);
    triupe{l} = edge(triupe{l},'Canny');
end

%prepare down triangles
temptridown = double(template_bw.downTri);

for l = 1:7
    sub = 0.3*l;
    tridowne{l} = imresize(temptridown,sub);
    tridowne{l} = edge(tridowne{l},'Canny');
end

%prepare squares

SquareSizes = round(linspace(150,300,7));
for m = 1:length(SquareSizes)
    squareedge{m} = CreateSquare(SquareSizes(m));
end


    for k = 2 %:10%length(maskFiles)
        %toSplit = strsplit(maskFiles(k).name,{mask.',''});
        mask = imread([dirname, '/', maskFiles(k).name]);
        %mask = imread(strjoin(['mejora/', 'mask.', toSplit(2), '.HSV.png'],''));
        %im = imread(strjoin([dirname,'/', toSplit(2),'.jpg'],''));
        %im = rgb2gray(im); % Original image to gray space
        ed = edge(mask,'Canny'); % Mask contour from the mask
        D = bwdist(ed,'Euclidean'); % distance transform
        
        %circleedge = CreateCircles(CircleSizes);
        
        %temp = template_edge.circle;
        
        %temp = imresize(double(temp),[60 60]);
        %temp = im2bw(temp);
        
        %falta hacerlo para cada tamaño de template
        %DupTri = conv2(D,double(template_edge.upTri),'same');
        for p = 1:length(CircleSizes)
        Dcircle{p} = conv2(D,double(circleedge{p}),'valid');
        end
        
        for p = 1:length(CircleSizes)
        Dtriup{p} = conv2(D,double(triupe{p}),'valid');
        end
        
        for p = 1:length(CircleSizes)
        Dtridown{p} = conv2(D,double(tridowne{p}),'valid');
        end
        
        for p = 1:length(CircleSizes)
        Dsquare{p} = conv2(D,double(squareedge{p}),'valid');
        end
        
        
%         DdownTri = conv2(D,double(template_edge.downTri),'valid');
%         Dcircle = conv2(D,double(template_edge.circle),'valid');
%         Dsquare = conv2(D,double(template_edge.square),'valid');
        
%         [ColumnMin, Y] = min(DupTri);
%         [~, X] = min(ColumnMin);
%         location = [X, Y(X)];
        [m_height,m_width] = size(mask);
        %T = single(template_edge.upTri);
        %M = zeros(m_height,m_width);
        %[T_height, T_width] = size(T);
        d = 1;
        %f=T(4363463);
        
       valmin = 999999999999999;
       for p=1:length(CircleSizes) 
       valcomp = min(min(Dcircle{p}));
       if(valcomp<valmin)
           [j,i]=find(Dcircle{p}==min(valcomp));
           w_pos{k}(d,:) = [j,i,size(circleedge{p},1),size(circleedge{p},1)];
           valmin = valcomp;
       end
       end
       
      
       d = d + 1;
      valmin = 999999999999999;
       for p=1:length(CircleSizes) 
       valcomp = min(min(Dtriup{p}));
       if(valcomp<valmin)
           [j,i]=find(Dtriup{p}==min(valcomp));
           w_pos{k}(d,:) = [j,i,size(triupe{p},1),size(triupe{p},1)];
           valmin = valcomp;
       end
       end 
       
       
       d = d + 1;
       
       valmin = 999999999999999;
       for p=1:length(CircleSizes) 
       valcomp = min(min(Dtridown{p}));
       if(valcomp<valmin)
           [j,i]=find(Dtridown{p}==min(valcomp));
           w_pos{k}(d,:) = [j,i,size(tridowne{p},1),size(tridowne{p},1)];
           valmin = valcomp;
       end
       end 
       
       d = d + 1;
       
       valmin = 999999999999999;
       for p=1:length(CircleSizes) 
       valcomp = min(min(Dsquare{p}));
       if(valcomp<valmin)
           [j,i]=find(Dsquare{p}==min(valcomp));
           w_pos{k}(d,:) = [j,i,size(squareedge{p},1),size(squareedge{p},1)];
           valmin = valcomp;
       end
       end  
        
        
 %f=D(4363463);       
%         for i=1:m_height %Here we will see the convolution result, the position with values near to 0, will be the
%              for j=1:m_width
%                  for p=1:length(CircleSizes)
%                     if (Dcircle{p}(i,j)<150) 
%                         
%                     w_pos{k}(d,:) = [j,i,size(Dcircle{p},1),size(Dcircle{p},1)];
%                     d = d + 1;
%                     end
%                 
%                 end
%             end
%         end
       
        
%         for i=1:m_height %Here we will see the convolution result, the position with values near to 0, will be the
%              for j=1:m_width
%                  for p=1:length(CircleSizes)
%                     if (Dtriup{p}(i,j)<150) 
%                     w_pos{k}(d,:) = [j-size(Dtriup{p},1),i-size(Dtriup{p},1),size(Dtriup{p},1),size(Dtriup{p},1)];
%                     d = d + 1;
%                     end
%                 
%                 end
%             end
%         end
%         
%         for i=1:m_height %Here we will see the convolution result, the position with values near to 0, will be the
%              for j=1:m_width
%                  for p=1:length(CircleSizes)
%                     if (Dtridown{p}(i,j)<150) 
%                     w_pos{k}(d,:) = [j-size(Dtridown{p},1),i-size(Dtridown{p},1),size(Dtridown{p},1),size(Dtridown{p},1)];
%                     d = d + 1;
%                     end
%                 
%                 end
%             end
%         end
%         
%         for i=1:m_height %Here we will see the convolution result, the position with values near to 0, will be the
%              for j=1:m_width
%                  for p=1:length(CircleSizes)
%                     if (Dsquare{p}(i,j)<150) 
%                     w_pos{k}(d,:) = [j-size(Dsquare{p},1),i-size(Dsquare{p},1),size(Dsquare{p},1),size(Dsquare{p},1)];
%                     d = d + 1;
%                     end
%                 
%                 end
%             end
%         end
%         
%         
% f=D(4363463);

%         [m_height,m_width] = size(mask);
%         T = single(template_edge.upTri);
%         M = zeros(m_height,m_width);
%         [T_height, T_width] = size(T);
%         %M = zeros(T_height,T_width);
%         %l = 1; o = 1;
%         %i = 1; j = 1;
%         for i = 1:T_height:(m_height - T_height)
%             for j = 1:T_width:(m_width - T_width)
%                 M(i:(i+length(T)-1),j:j:(j+length(T)-1)) = D(i:(i+length(T)-1),j:(j+length(T)-1)).*T;
%                 %suma(l,o) = sum(M(:));
%                 %min de sum
%                 %o = o + 1;
%             end
%             %l = l + 1; 
%         end
%         
%         [x,y] = find(suma==0);
        %pos = min(suma(:)); %pillar posició
        %relacionar posicioó minima de suma amb la posició i,j de la imatge
        %original
        
        %if D
                      
%             Goal: Find placement of T in D that minimizes the sum, M, of the DT
% multiplied by the pixel values in T
% ? if T is an exact match to B at location (i,j) then M(i,j) = 0
% ? if the edges in B are slightly displaced from their ideal locations in T, we
% still get a good match using the distance transform technique 

imshow(ed);
    
hold on
for j = 1:length(w_pos{k})
    rectangle('position',[w_pos{k}(j,1), w_pos{k}(j,2), w_pos{k}(j,3), w_pos{k}(j,4)],'Edgecolor','g')
end
pause();
    end
    
end


% function chamfer(maskFiles,template_edge)
% % B -> maskFiles
% % T -> templatge_edge
% 
% 
% 
%     for i = 1:length(maskFiles)
%         toSplit = strsplit(maskFiles(i).name,{'mask.','.png'});
%         mask = imread(strjoin([dirname, '/mask/mask.', toSplit(2), '.png'],''));
%         im = imread(strjoin([dirname,'/', toSplit(2),'.jpg'],''));
%         im = rgb2gray(im);
%         ed = edge(im,'Canny'); % Mask contour from the mask
%         D = bwdist(ed,'Euclidean'); % distance transform
%     end
% end