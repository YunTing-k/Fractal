t=16;
tall=t;
num=2;
N=num;
while(t>=1)
    t=t-1;
    N=N*2-1;
end%计算共需分配多少个内存单位
xx=linspace(-1,1,N);
t=tall;
y=zeros(1,N);
ytmp=zeros(1,N);
y(1)=0;
y(2)=0;
while(t>=1)
    tmp=(tall-t+1);
    tmp=power(2,0.5*tmp);%以上保证了布朗运动的方差与时间成正比
    
    for i=1:1:num
        ytmp(2*i-1)=y(i);%插空
    end
    
    for j=1:2:(2*num-3)
        ytmp(j+1)=(ytmp(j)+ytmp(j+2))/2+normrnd(0,1)/(tmp);%插空
    end
    
    for k=1:1:(2*num-1)
        y(k)=ytmp(k);%复制移回来
    end
    
    num=2*num-1;
    t=t-1;
end