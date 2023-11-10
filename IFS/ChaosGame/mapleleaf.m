%N=198541;
N=2000000;
%F=Ax+B;
A1=[0.5787 -0.0098;0.0032 0.5957];
A2=[0.3189 0.3366;-0.2201 0.3921];
A3=[0.3077 -0.3530;0.2127 0.3808];
A4=[0.4897 -0.0008;0.0165 0.6496];
B1=[0.7085;0.1522];
B2=[-0.1099;1.5624];
B3=[2.4518;0.8623];
B4=[0.8505;0.6792];
p=[0.3271 0.1889 0.1823 0.3017];
a=[0;0];
kk=rand(1,N);
figure;
hold on;
result=zeros(N,2);
k=1;
plot(a(1),a(2),'.', 'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',1);
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