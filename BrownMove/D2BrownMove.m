t=16;
tall=t;
num=2;
N=num;
while(t>=1)
   
    t=t-1;
    N=N*2-1;
end%���㹲�������ٸ��ڴ浥λ


t=tall;
x=zeros(1,N);
y=zeros(1,N);
xtmp=zeros(1,N);
ytmp=zeros(1,N);
x(1)=-1;
x(2)=normrnd(0,1);
y(1)=-1;
y(2)=normrnd(0,1);



while(t>=1)
    tmp=(tall-t+1);
    tmp=power(2,0.5*tmp);%���ϱ�֤�˲����˶��ķ�����ʱ�������
    
    for i=1:1:num
        xtmp(2*i-1)=x(i);
        ytmp(2*i-1)=y(i);%���
    end
    
    for j=1:2:(2*num-3)
        xtmp(j+1)=(xtmp(j)+xtmp(j+2))/2+normrnd(0,1)/(tmp);%���
        ytmp(j+1)=(ytmp(j)+ytmp(j+2))/2+normrnd(0,1)/(tmp);
    end
    
    for k=1:1:(2*num-1)
        x(k)=xtmp(k);%�����ƻ���
        y(k)=ytmp(k);
    end
    
    num=2*num-1;
    t=t-1;
end
