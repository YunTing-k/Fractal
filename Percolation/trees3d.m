%此函数用于生成三维孔隙介质
function [treepos3d,startx,starty,startz]=trees3d(x,y,z,p)
treepos3d=zeros(x,y,z);
startx=0;
starty=0;
startz=0;
for i=1:x
    for j=1:y
        for k=1:z
        if rand()<=p
            treepos3d(i,j,k)=1;
            if startx==0&&i>x/4&&i<x*3/4&&j>y/4&&j<y*3/4&&k>z/4&&k<z*3/4%此判断语句用于区分边缘取点和中央取点，若边缘则只有startx==0
                startx=i;
                starty=j;
                startz=k;
            end
        end
        end
    end
end
% hold on;