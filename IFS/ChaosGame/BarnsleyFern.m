N=200000;
%F=Ax+B;
A1=[0 0;0 0.16];
A2=[0.85 0.04;-0.04 0.85];
A3=[0.2 -0.26;0.23 0.22];
A4=[-0.15 0.28;0.26 0.24];
B1=[0.5;0];
B2=[0.075;0.18];
B3=[0.4;0.045];
B4=[0.575;-0.086];
%p=[0.01 0.85 0.07 0.07];
p=[0.03 0.73 0.13 0.11];
%p=[0.25,0.25,0.25,0.25];
a=[0;0];
kk=rand(1,N);
figure;
hold on;
plot(a(1),a(2),'.', 'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',1);
result=zeros(N,2);
k=1;
for i=1:N
    if(kk(i)<=p(1))
        a=A1*a+B1;
    elseif(kk(i)<=p(1)+p(2))
        a=A2*a+B2;
    elseif(kk(i)<=1-p(4))
        a=A3*a+B3;
    else
        a=A4*a+B4;
    end
    result(k,1)=a(1);
    result(k,2)=a(2);
    k=k+1;
end
plot(result(:,1),result(:,2),'.', 'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',1);