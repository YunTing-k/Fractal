%���ļ������߸��죬ÿ�����Ӧһ�����ܣ������֮���������հ��зֿ�
clear;
x=50;
y=50;
x3d=30;
y3d=30;
z3d=30;
simtimes=1000;
simtimes3d=1000;


%����������ʾ�õ�ɭ�ּ����Ż�ͼ
[treepos,startx,starty]=trees(x,y,0.8);
figure(2);
for i=0:x
    plot([i,i],[0,y],'k');
    axis ([0,x+1,0,y+1]);
    hold on;
end
for i=0:y
    plot([0,x],[i,i],'k');
    hold on;
end
for i=1:x
    for j=1:y
        if treepos(i,j)==1
            fill([i,i,i-1,i-1],[j-1,j,j,j-1],'g');
        end
    end
end
hold on;
[eachnum,position]=fire(treepos,x,y,startx,starty,0);


%���ڶ�άɭ�ֻ��ֱ�����ľ������p��ϵ��ģ�⣬ͨ�����ļ���ʼ�ı�x��y���Ըı�L
eachnum=zeros(1,simtimes);
rate=zeros(1,50);
for j=1:50
    onfire=0.02*j;
    totalnum=0;
for i=1:simtimes
    [treepos,startx,starty]=trees(x,y,onfire);
    [eachnum(i),position]=fire(treepos,x,y,startx,starty,0);
    totalnum=totalnum+eachnum(i);
end
rate(j)=totalnum/x/y/onfire/simtimes;
end
x1=linspace(0.02,1,50);
plot(x1,rate,'k');
axis([0,1,0,1]);
hold on;
xlabel('pֵ');
ylabel('������ľ����ռ����ľ�����ı���');
%�ı�L=50ʱ��ģ�� 
eachnum=zeros(1,simtimes);
rate=zeros(1,50);
for j=1:50
    onfire=0.02*j;
    totalnum=0;
for i=1:simtimes
    [treepos,startx,starty]=trees(50,50,onfire);
    [eachnum(i),position]=fire(treepos,50,50,startx,starty,0);
    totalnum=totalnum+eachnum(i);
end
rate(j)=totalnum/50/50/onfire/simtimes;
end
x1=linspace(0.02,1,50);
plot(x1,rate,'r');
axis([0,1,0,1]);
xlabel('pֵ');
ylabel('������ľ����ռ����ľ�����ı���');
%�ı�L=100ʱ��ģ��
eachnum=zeros(1,simtimes);
rate=zeros(1,50);
for j=1:50
    onfire=0.02*j;
    totalnum=0;
for i=1:simtimes
    [treepos,startx,starty]=trees(100,100,onfire);
    [eachnum(i),position]=fire(treepos,100,100,startx,starty,0);
    totalnum=totalnum+eachnum(i);
end
rate(j)=totalnum/100/100/onfire/simtimes;
end
x1=linspace(0.02,1,50);
plot(x1,rate,'b');
axis([0,1,0,1]);
hold on;
%�ı�L=200ʱ��ģ��
eachnum=zeros(1,simtimes);
rate=zeros(1,50);
for j=1:50
    onfire=0.02*j;
    totalnum=0;
for i=1:simtimes
    [treepos,startx,starty]=trees(200,200,onfire);
    [eachnum(i),position]=fire(treepos,200,200,startx,starty,0);
    totalnum=totalnum+eachnum(i);
end
rate(j)=totalnum/200/200/onfire/simtimes;
end
x1=linspace(0.02,1,50);
plot(x1,rate,'g');
axis([0,1,0,1]);
legend('L=20','L=50','L=100','L=200');


%��ά�������Ŀ�϶ռ�ܿ�϶�ı�����p��ϵ��ģ��
totalnum=0;
eachnum=zeros(1,simtimes3d);
rate=zeros(1,50);
for j=1:50
    onfire=0.02*j;
    totalnum=0;
    for i=1:simtimes3d
        [treepos3d,startx,starty,startz]=trees3d(x3d,y3d,z3d,onfire);
        [eachnum(i),position]=fire3d(treepos3d,x3d,y3d,z3d,startx,starty,startz,0);
        totalnum=totalnum+eachnum(i);
    end
rate(j)=totalnum/x3d/y3d/z3d/onfire/simtimes3d;
end
x1=linspace(0.02,1,50);
plot(x1,rate);
axis([0,1,0,1]);
xlabel('pֵ');
ylabel('��ɢ���ĸ���ռ�ܸ��ӵı���');


%��ˮ��͸�ʺ���������϶֮����ͨ������p��ϵ��ģ�⣬��������������ͨ���ı�seep����ʵ��
through=zeros(x3d,y3d);
totalthrough=zeros(1,50);  
for i=1:50
    pickpoint=0.02*i;
    surface_hole=0;
    for j=1:x3d
        for k=1:y3d
            [treepos3d,startx,starty,startz]=trees3d(x3d,y3d,z3d,pickpoint);
            if treepos3d(j,k,1)==1
                [through(j,k),treepos3d]=seep(treepos3d,x3d,y3d,z3d,j,k,1);
                surface_hole=surface_hole+1;
            else
                through(j,k)=0;
            end
        end
    end
    totalthrough(i)=sum(sum(through))/surface_hole;
end
x1=linspace(0.02,1,50);
plot(x1,totalthrough);
axis([0,1,0,1]);
xlabel('pֵ');
ylabel('����϶��ͨ����');
