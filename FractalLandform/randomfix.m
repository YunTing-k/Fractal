function [a]=randomfix(i,j,num,input,tag,L,H)
m=[tag(num,i),tag(num,i+1)];
n=[tag(num,j),tag(num,j+1)];
z=[input(tag(num,i),tag(num,j)),input(tag(num,i+1),tag(num,j));input(tag(num,i),tag(num,j+1)),input(tag(num,i+1),tag(num,j+1))];
[x,y]=meshgrid(m,n);
a=interp2(x,y,z,(tag(num,i)+tag(num,i+1))/2,(tag(num,j)+tag(num,j+1))/2,'spline');
%a=interp2(x,y,z,(tag(num,i)+tag(num,i+1))/2,(tag(num,j)+tag(num,j+1))/2,'linear');
%a=griddata(x,y,z,(tag(num,i)+tag(num,i+1))/2,(tag(num,j)+tag(num,j+1))/2);
ran=randomsource();
ran=H*ran;
%ran=rand*2-1;
%a=a+ran/(2*b^(num-1));
a=a+ran/((L)^(num-1));
%a=a+ran/((1.5)^(num-1));
end