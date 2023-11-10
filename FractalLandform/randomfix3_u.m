function [a]=randomfix3_u(input,x0,y0,yl,yr,xd,num,L,H)
b=input;
x=[x0,xd,x0];
y=[yl,y0,yr];
z=[b(x0,yl),b(xd,y0),b(x0,yr)];
a=griddata(x,y,z,x0,y0);
%a=sum(z)/3;
ran=randomsource();
ran=H*ran;
a=a+ran/((L)^(num-1));
end