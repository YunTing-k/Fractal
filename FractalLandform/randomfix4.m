function [a]=randomfix4(input,x0,y0,yl,yr,xu,xd,num,L,H)
b=input;
x=[x0,xu,xd,xd];
y=[yl,y0,yr,y0];
z=[b(x0,yl),b(xu,y0),b(xd,yr),b(xd,y0)];
a=griddata(x,y,z,x0,y0);
%a=sum(z)/4;
ran=randomsource();
ran=H*ran;
a=a+ran/((L)^(num-1));
end