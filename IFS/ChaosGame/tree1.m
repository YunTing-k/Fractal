%N=198541;
N=2000000;
%F=Ax+B;
A1=[-0.04 0;-0.19 -0.47];
A2=[0.65 0;0 0.56];
A3=[0.41 0.46;-0.39 0.61];
A4=[0.52 -0.35;0.25 0.74];
B1=[-0.12;0.3];
B2=[0.06;1.56];
B3=[0.46;0.4];
B4=[-0.48;0.38];
p=[0.2 0.2 0.3 0.3];
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