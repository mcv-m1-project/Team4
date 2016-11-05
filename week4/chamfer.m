function chamfer(maskFiles,template_edge)
% B -> maskFiles
% T -> templatge_edge

    for i = 1:length(maskFiles)
        toSplit = strsplit(maskFiles(i).name,{'mask.','.png'});
        mask = imread(strjoin([dirname, '/mask/mask.', toSplit(2), '.png'],''));
        im = imread(strjoin([dirname,'/', toSplit(2),'.jpg'],''));
        im = rgb2gray(im);
        ed = edge(im,'Canny'); % Mask contour from the mask
        D = bwdist(ed,'Euclidean'); % distance transform
        
        sizeuptri = size(template_edge.template_edge.upTri,1);
        sizesuptri = round(sizeuptri.*[0.3 0.5 1 1.5 2]);
        
        sizedowntri = size(template_edge.template_edge.downTri,1);
        sizesdowntri = round(sizedowntri.*[0.3 0.5 1 1.5 2]);
        
        sizecircle = size(template_edge.template_edge.circle,1);
        sizecircle = round(sizecircle.*[0.3 0.5 1 1.5 2]);
        
        sizesquare = size(template_edge.template_edge.square,1);
        sizessquare = round(sizesquare.*[0.3 0.5 1 1.5 2]);
        
        %falta hacerlo para cada tamaño de template
        DupTri = conv2(D,template_edge.template_edge.upTri,'same');
        DdownTri = conv2(D,template_edge.template_edge.downTri,'same');
        Dcircle = conv2(D,template_edge.template_edge.circle,'same');
        Dsquare = conv2(D,template_edge.template_edge.square,'same');
        
        d = 1;
        [im_height,im_width] = size(im);
        
        for i=1:im_height %Here we will see the convolution result, the position with values near to 0, will be the 
        for j=1:im_width
            if (imfilt(i,j)<threshold) 
                w_pos(d,:) = [j,i,w_width,w_height];
                d = d + 1;
            end
        end
        end
        
        
    end
end