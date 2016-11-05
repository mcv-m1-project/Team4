function chamfer(dirname,maskFiles,template_edge)
% B -> maskFiles
% T -> templatge_edge

    for k = 1:length(maskFiles)
        %toSplit = strsplit(maskFiles(k).name,{mask.',''});
        mask = imread([dirname, '/', maskFiles(k).name]);
        %mask = imread(strjoin(['mejora/', 'mask.', toSplit(2), '.HSV.png'],''));
        %im = imread(strjoin([dirname,'/', toSplit(2),'.jpg'],''));
        %im = rgb2gray(im); % Original image to gray space
        ed = edge(mask,'Canny'); % Mask contour from the mask
        D = bwdist(ed,'Euclidean'); % distance transform
        
%         sizeuptri = size(template_edge.upTri,1);
%         sizesuptri = round(sizeuptri.*[0.3 0.5 1 1.5 2]);
%         
%         sizedowntri = size(template_edge.downTri,1);
%         sizesdowntri = round(sizedowntri.*[0.3 0.5 1 1.5 2]);
%         
%         sizecircle = size(template_edge.circle,1);
%         sizecircle = round(sizecircle.*[0.3 0.5 1 1.5 2]);
%         
%         sizesquare = size(template_edge.square,1);
%         sizessquare = round(sizesquare.*[0.3 0.5 1 1.5 2]);
        
        %falta hacerlo para cada tamaño de template
        DupTri = conv2(D,double(template_edge.upTri),'valid');
%         DdownTri = conv2(D,double(template_edge.downTri),'valid');
%         Dcircle = conv2(D,double(template_edge.circle),'valid');
%         Dsquare = conv2(D,double(template_edge.square),'valid');
        
%         [ColumnMin, Y] = min(DupTri);
%         [~, X] = min(ColumnMin);
%         location = [X, Y(X)];
        [m_height,m_width] = size(mask);
        T = single(template_edge.upTri);
        %M = zeros(m_height,m_width);
        [T_height, T_width] = size(T);
        d = 1;
        for i=1:m_height %Here we will see the convolution result, the position with values near to 0, will be the 
            for j=1:m_width
                if (DupTri<10) 
                w_pos(d,:) = [j,i,T_width,T_height];
                d = d + 1;
                end
            end
        end
        
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
        pos = min(suma(:)); %pillar posició
        %relacionar posicioó minima de suma amb la posició i,j de la imatge
        %original
        
        %if D
                      
%             Goal: Find placement of T in D that minimizes the sum, M, of the DT
% multiplied by the pixel values in T
% ? if T is an exact match to B at location (i,j) then M(i,j) = 0
% ? if the edges in B are slightly displaced from their ideal locations in T, we
% still get a good match using the distance transform technique        
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