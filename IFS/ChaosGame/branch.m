%N=198541;
N=2000000;
%F=Ax+B;
A1=[0.03 0;0 0.6];
A2=[0.03 0;0 -0.4];
A3=[0.386 -0.155;0.104 0.580];
A4=[0.433 -0.200;0.100 0.346];
A5=[0.283 0.354;-0.283 0.354];
B1=[0;0];
B2=[0;1];
B3=[0;1];
B4=[0;0.9];
B5=[0;0.8];
p=[0.05 0.05 0.3 0.3 0.3];
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
    elseif(kk(i)<=p(1)+p(2)+p(3))
        a=A3*a+B3;
    elseif(kk(i)<=1-p(4))
        a=A4*a+B4;
    else
        a=A5*a+B5;
    end
    result(k,1)=a(1);
    result(k,2)=a(2);
    k=k+1;
end
plot(result(:,1),result(:,2),'.', 'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',1);