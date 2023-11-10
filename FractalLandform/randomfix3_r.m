function [a]=randomfix3_r(input,x0,y0,yl,xu,xd,num,L,H)
b=input;
x=[xu,x0,xd];
y=[y0,yl,y0];
z=[b(xu,y0),b(x0,yl),b(xd,y0)];
a=griddata(x,y,z,x0,y0);
%a=sum(z)/3;
ran=randomsource();
ran=H*ran;
a=a+ran/((L)^(num-1));
end