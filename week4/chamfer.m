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


    for k = 77:length(maskFiles)
        %toSplit = strsplit(maskFiles(k).name,{mask.',''});
        mask = imread([dirname, '/', maskFiles(k).name]);
        %mask = imread(strjoin(['mejora/', 'mask.', toSplit(2), '.HSV.png'],''));
        %im = imread(strjoin([dirname,'/', toSplit(2),'.jpg'],''));
        %im = rgb2gray(im); % Original image to gray space
        ed = edge(mask,'Canny'); % Mask contour from the mask
        D = bwdist(ed,'Euclidean'); % distance transform
        
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
        
        [m_height,m_width] = size(mask);

        d = 1;

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
        
        j=1;
        while j<=length(w_pos{k}) % for each windowCanidate
            windowCandidates = struct('x', w_pos{k}(j,1), 'y', w_pos{k}(j,2), 'w', w_pos{k}(j,3), 'h', w_pos{k}(j,4));
            j = j + 1;
        end
        
        [pathstr_r, name_r, ext_r] = fileparts(maskFiles(k).name);
        save (['matTest2/' name_r, '.mat'], 'windowCandidates');
       
%         imshow(ed);
%         hold on
%         for j = 1:length(w_pos{k})
%             rectangle('position',[w_pos{k}(j,1), w_pos{k}(j,2), w_pos{k}(j,3), w_pos{k}(j,4)],'Edgecolor','g')
%         end
%         hold off
%         pause();
        
        MaskP = paintMask (mask, windowCandidates);
        imwrite(MaskP, fullfile('maskPNG/',[name_r '.png']));
        
        clear windowCandidates
        k
    end
end
