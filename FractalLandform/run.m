%������
initialization;%��ʼ��
[point,mark]=getnum(point,grade,list,tag,mark,table,L,H);
a=[1:2^grade+1];
b=[1:2^grade+1];
config=[1,1,20,0,0.5];%C1�Ƿ����ֵ����C2�Ƿ���зֽ磬C3�ֽ�������,C4�Ƿ��ݴε�����C5�ݴ���ֵ
point=pointconfig(config,grade,point);
[x,y]=meshgrid(a,b);
[xx,yy]=meshgrid(1:0.2:2^grade+1);
%z=interp2(x,y,point,xx,yy,'linear');
%z=interp2(x,y,point,xx,yy,'nearest');
z=interp2(x,y,point,xx,yy,'spline');
%z=interp2(x,y,point,xx,yy);
figure
hold on;
%zz=9000-z;
fig = meshc(xx,yy,z);%����ͼ��\

%meshc(xx,yy,zz);%����ͼ��
%surfc(xx,yy,z);
% figure
% contour(z,30);