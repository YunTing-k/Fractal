clear;%初始化函数
grade=7;%阶数
L=2.2;%尺度变换因子
H=10;%高度因子
list=zeros(2,grade);
% h1=-1;h2=-1;h3=1;h4=1;
h1=randomsource();
h2=randomsource();
h3=randomsource();
h4=randomsource();
for i=1:grade
    list(1,i)=2^(i-1)+1;
end
for i=1:grade
    list(2,i)=2^i;
end
a=list(1,:);
a=a(end:-1:1);
b=list(2,:);b(grade)=0;
b=b(end:-1:1);
list(1,:)=a;
list(2,:)=b;
tag=zeros(grade,2^(grade-1)+1);
c=[1:2:2^grade+1];
d=size(c);
d=d(2);
for i=1:grade
    tag(i,1:2^(i-1)+1)=c(1:2^(grade-i):d);
end
point=zeros(2^grade+1,2^grade+1);
point(1,1)=h1;
point(1,2^grade+1)=h2;
point(2^grade+1,1)=h3;
point(2^grade+1,2^grade+1)=h4;
mark=zeros(2^grade+1,2^grade+1);
mark(1,1)=1;
mark(1,2^grade+1)=1;
mark(2^grade+1,1)=1;
mark(2^grade+1,2^grade+1)=1;
table=zeros(grade,2^grade+1);
e=[1:2^grade+1];
for i=1:grade
    table(i,1:2^(i)+1)=e(1:2^(grade-i):2^grade+1);
end
clear a;
clear b;
clear c;
clear d;
clear e;
clear i;