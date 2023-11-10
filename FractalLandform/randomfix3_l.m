function [a]=randomfix3_l(input,x0,y0,yr,xu,xd,num,L,H)
b=input;
x=[xu,x0,xd];
y=[y0,yr,y0];
z=[b(xu,y0),b(x0,yr),b(xd,y0)];
a=griddata(x,y,z,x0,y0);
%a=sum(z)/3;
ran=randomsource();
ran=H*ran;
a=a+ran/((L)^(num-1));
end