function [POINT]=pointconfig(config,grade,point)%对图像进行调整
POINT=point;
if(config(1)==1)
   POINT=abs(POINT);
end
if(config(2)==1)
   for i=1:2^grade+1
    for j=1:2^grade+1
        if(POINT(i,j)<config(3))
            POINT(i,j)=config(3);
        end
    end
   end
end
if(config(4)==1)
    POINT=POINT.^(config(5));
end
end