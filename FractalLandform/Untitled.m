clear;
z=[1 1 1 1 1;1 1 2 3 1;1 2 2 4 1;1 1 2 3 1;1 1 1 2 1];
[x,y]=meshgrid(1:5);
[xx,yy]=meshgrid(1:0.1:5);
zz=interp2(x,y,z,xx,yy,'linear');
meshc(xx,yy,zz);