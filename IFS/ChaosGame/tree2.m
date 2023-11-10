%N=198541;
N=2000000;
%F=Ax+B;
A1=[0.05 0;0 0.6];
A2=[0.05 0;0 -0.5];
A3=[0.46 -0.32;0.38 0.38];
A4=[0.47 -0.15;0.17 0.42];
A5=[0.43 0.27;-0.25 0.48];
A6=[0.45 0.23;-0.31 0.33];
B1=[0;0];
B2=[0;0.8];
B3=[0;0.48];
B4=[0;0.88];
B5=[0;0.8];
B6=[0;0.4];
p=[0.1 0.14 0.2 0.18 0.18 0.2];
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
    elseif(kk(i)<=p(1)+p(2)+p(3)+p(4))
        a=A4*a+B4;
    elseif(kk(i)<=1-p(6))
        a=A5*a+B5;
    else
        a=A6*a+B6;
    end
    result(k,1)=a(1);
    result(k,2)=a(2);
    k=k+1;
end
plot(result(:,1),result(:,2),'.', 'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',1);