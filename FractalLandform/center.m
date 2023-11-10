function [a,b]=center(input,num,list,tag,mark,L,H)%中心点的计算
a=input;
b=mark;
  for i=1:2^(num-1)
      for j=1:2^(num-1)
          a(list(1,num)+list(2,num)*(i-1),list(1,num)+list(2,num)*(j-1))=randomfix(i,j,num,a,tag,L,H);
          b(list(1,num)+list(2,num)*(i-1),list(1,num)+list(2,num)*(j-1))=1;
      end
  end
end