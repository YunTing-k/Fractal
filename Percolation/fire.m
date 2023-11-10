%此函数用于给森林点火
function [totalnum,afterfire]=fire(treepos,x,y,startx,starty,num)
if startx>0&&startx<=x&&starty>0&&starty<=y
    if treepos(startx,starty)==1
    treepos(startx,starty)=2;
    num=num+1;
    fill([startx,startx,startx-1,startx-1],[starty,starty-1,starty-1,starty],'r')
     hold on;
     %上面两句用于画出火灾波及到的点，不画图时可以注释掉
    [num1,treepos]=fire(treepos,x,y,startx-1,starty,num);
    [num2,treepos]=fire(treepos,x,y,startx+1,starty,num);
    [num3,treepos]=fire(treepos,x,y,startx,starty-1,num);
    [num4,treepos]=fire(treepos,x,y,startx,starty+1,num);
    totalnum=num1+num2+num3+num4-3*num;
    afterfire=treepos;
    else
        totalnum=num;
        afterfire=treepos;
    end
else
    totalnum=num;
    afterfire=treepos;
end
    
