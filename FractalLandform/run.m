%主程序
initialization;%初始化
[point,mark]=getnum(point,grade,list,tag,mark,table,L,H);
a=[1:2^grade+1];
b=[1:2^grade+1];
config=[1,1,20,0,0.5];%C1是否绝对值处理，C2是否进行分界，C3分界线设置,C4是否幂次调整，C5幂次数值
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
fig = meshc(xx,yy,z);%绘制图像\

%meshc(xx,yy,zz);%绘制图像
%surfc(xx,yy,z);
% figure
% contour(z,30);