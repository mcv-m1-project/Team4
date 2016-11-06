function finalmask= paintMask (mask,structed)

for p=1:length(structed)
            x1(p) = structed(p).x;
            y1(p) = structed(p).y;
            w(p) = structed(p).w;
            h(p) = structed(p).h;
            
            I{p} = imcrop(mask,[x1(p) y1(p) w(p) h(p)]);
end
mask(:,:)=0;

for p=1:length(structed)
   
           for j=(round(x1(p))):(round(x1(p)+w(p)))
               %for i=(fix(y1(p))):(fix(y1(p)-h(p)))
               for i=(round(y1(p))):(round(y1(p)+h(p)))
                   Im=I{p};
                   mask(i,j)=Im((i-(round(y1(p))-1)),(j-(round(x1(p))-1)));
               end
           end
end
finalmask=mask;
end

