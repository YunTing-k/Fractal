%此函数用于得出不同p下渗流到的孔隙占总孔隙的比例
function [totalnum3d,afterfire]=fire3d(treepos3d,x,y,z,startx,starty,startz,num)
if startx>0&&startx<=x&&starty>0&&starty<=y&&startz>0&&startz<=z
    if treepos3d(startx,starty,startz)==1
    treepos3d(startx,starty,startz)=2;
    num=num+1;
    %下面的六个mesh用于画出三维渗流的图像，不画图时可注释掉
    mesh([startx-1,startx],[starty-1,starty],[startz,startz;startz,startz]);
    hold on;
    mesh([startx-1,startx],[starty-1,starty],[startz-1,startz-1;startz-1,startz-1]);
    mesh([startx,startx],[starty-1,starty],[startz-1,startz;startz-1,startz]);
    mesh([startx-1,startx-1],[starty-1,starty],[startz-1,startz;startz-1,startz]);
    mesh([startx-1,startx],[starty,starty],[startz-1,startz-1;startz,startz]);
    mesh([startx-1,startx],[starty-1,starty-1],[startz-1,startz-1;startz,startz]);
    [num1,treepos3d]=fire3d(treepos3d,x,y,z,startx-1,starty,startz,num);
    [num2,treepos3d]=fire3d(treepos3d,x,y,z,startx+1,starty,startz,num);
    [num3,treepos3d]=fire3d(treepos3d,x,y,z,startx,starty-1,startz,num);
    [num4,treepos3d]=fire3d(treepos3d,x,y,z,startx,starty+1,startz,num);
    [num5,treepos3d]=fire3d(treepos3d,x,y,z,startx,starty,startz-1,num);
    [num6,treepos3d]=fire3d(treepos3d,x,y,z,startx,starty,startz+1,num);
    totalnum3d=num1+num2+num3+num4+num5+num6-5*num;
    afterfire=treepos3d;
    else
        totalnum3d=num;
        afterfire=treepos3d;
    end
else
    totalnum3d=num;
    afterfire=treepos3d;
end