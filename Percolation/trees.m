%�˺�����������ɭ��
function [treepos,startx,starty]=trees(x,y,p)
treepos=zeros(x,y);
startx=0;
starty=0;
for i=0:x %��for��������������񣬲���ͼʱ��ע�͵�
    plot([i,i],[0,y],'k');
    axis ([0,x+1,0,y+1]);
    hold on;
end
for i=0:y
    plot([0,x],[i,i],'k');
    hold on;
end
for i=1:x
    for j=1:y
        if rand()<=p
            fill([i,i,i-1,i-1],[j-1,j,j,j-1],'g');%�˾����ڸ�����ľ�ĸ���ɫ������ͼʱ����ע�͵�
            treepos(i,j)=1;
            if startx==0&&i>x/4&&i<3*x/4&&j>y/4&&j<3*y/4 %���ж�����������ֱ�Եȡ�������ȡ�㣬����Ե��ֻ��startx==0
                startx=i;
                starty=j;
            end
        end
    end
end
% hold on;