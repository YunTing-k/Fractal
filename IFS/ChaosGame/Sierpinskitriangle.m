clear;
%close all;
figure;
num=10000;
A=[0,0];
B=[3,0];
C=[1.5,3*sqrt(3)/2];
point=[0,0];
hold on;
plot(A(1),A(2),'.', 'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',1);
plot(B(1),B(2),'.', 'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',1);
plot(C(1),C(2),'.', 'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',1);
plot(point(1),point(2),'.', 'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',1);
for i=1:num
    a=randi(3);
    if(a==1)
        point(1)=(point(1)+A(1))/2;
        point(2)=(point(2)+A(2))/2;
    elseif(a==2)
        point(1)=(point(1)+B(1))/2;
        point(2)=(point(2)+B(2))/2;
    else
        point(1)=(point(1)+C(1))/2;
        point(2)=(point(2)+C(2))/2;
    end
    plot(point(1),point(2),'.', 'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',3);
end
xlabel('x轴','fontsize',20);
ylabel('y轴','fontsize',20);
legend({'5万个点数模拟'},'FontSize',20)