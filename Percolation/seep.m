%�˺�������ģ����ˮ��͸������֮����ͨ�ĸ���
function [through,afterfire]=seep(treepos3d,x,y,z,startx,starty,startz)
layer=ceil(z*rand());
for i=1:30
    for j=1:30
        if treepos3d(i,j,layer)==1
            m=i;
            n=j;
        end
    end
end
%�����������ڱ���һ����ڲ���һ����ͨ��ģ�⣬����ˮ��͸��ģ����ע�͵�
if startx>0&&startx<=x&&starty>0&&starty<=y&&startz>0&&startz<=z
    if treepos3d(startx,starty,startz)==1
        treepos3d(startx,starty,startz)=2;
        if startz==layer&&startx==m&&starty==n%����������ͨģ����ж���������ˮ��͸��ģ�����ж�������Ϊstartz==z
            afterfire=treepos3d;
            through=1;
            return
        end
        [through,treepos3d]=seep(treepos3d,x,y,z,startx-1,starty,startz);
        if through==1
            afterfire=treepos3d;
            return 
        end
        [through,treepos3d]=seep(treepos3d,x,y,z,startx+1,starty,startz);
        if through==1 
            afterfire=treepos3d;
            return 
        end
        [through,treepos3d]=seep(treepos3d,x,y,z,startx,starty-1,startz);
        if through==1 
            afterfire=treepos3d;
            return 
        end
        [through,treepos3d]=seep(treepos3d,x,y,z,startx,starty+1,startz);
        if through==1
            afterfire=treepos3d;
            return 
        end
        [through,treepos3d]=seep(treepos3d,x,y,z,startx,starty,startz-1);
        if through==1 
            afterfire=treepos3d;
            return 
        end
        [through,treepos3d]=seep(treepos3d,x,y,z,startx,starty,startz+1);
        if through==1 
            afterfire=treepos3d;
            return 
        end
        afterfire=treepos3d;
    else
        through=0;
        afterfire=treepos3d;
    end
else
    through=0;
    afterfire=treepos3d;
    return
end