function [a,b]=mid(input,num,mark,table,L,H)%中点的计算
a=input;
b=mark;
  for i=1:2^num+1
      for j=1:2^num+1
          if(b(table(num,i),table(num,j))==1)
              continue;
              elseif((i>1)&&(i<2^num+1)&&(j>1)&&(j<2^num+1))%中心点
                  x0=table(num,i);y0=table(num,j);%p0点
                  yl=table(num,j-1);yr=table(num,j+1);
                  xu=table(num,i-1);xd=table(num,i+1);
                  c=randomfix4(a,x0,y0,yl,yr,xu,xd,num,L,H);%#ok<*NASGU> %注意收缩因子
                  a(x0,y0)=c;
                  b(x0,y0)=1;
              elseif((i==1)&&(j<2^num+1)&&(j>1))%没有上位点
                  x0=table(num,i);y0=table(num,j);%p0点
                  yl=table(num,j-1);yr=table(num,j+1);
                  xd=table(num,i+1);
                  c=randomfix3_u(a,x0,y0,yl,yr,xd,num,L,H);
                  a(x0,y0)=c;
                  b(x0,y0)=1;
              elseif((j==1)&&(i>1)&&(i<2^num+1))%没有左位点
                  x0=table(num,i);y0=table(num,j);%p0点
                  yr=table(num,j+1);
                  xu=table(num,i-1);xd=table(num,i+1);
                  c=randomfix3_l(a,x0,y0,yr,xu,xd,num,L,H);
                  a(x0,y0)=c;
                  b(x0,y0)=1;
               elseif((i==2^num+1)&&(j>1)&&(j<2^num+1))%没有下位点
                  x0=table(num,i);y0=table(num,j);%p0点
                  yl=table(num,j-1);yr=table(num,j+1);
                  xu=table(num,i-1); 
                  c=randomfix3_d(a,x0,y0,yl,yr,xu,num,L,H);
                  a(x0,y0)=c;
                  b(x0,y0)=1;
                elseif((j==2^num+1)&&(i>1)&&(i<2^num+1))%没有右位点
                  x0=table(num,i);y0=table(num,j);%p0点
                  yl=table(num,j-1);
                  xd=table(num,i+1);xd=table(num,i+1);  
                  c=randomfix3_r(a,x0,y0,yl,xu,xd,num,L,H);
                  a(x0,y0)=c;
                  b(x0,y0)=1;
          end
      end
  end
end
