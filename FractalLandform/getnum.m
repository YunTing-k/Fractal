function [result,markresult]=getnum(input,grade,list,tag,mark,table,L,H)
a=input;
b=mark;
  for i=1:grade
      [a,b]=center(a,i,list,tag,b,L,H);
      [a,b]=mid(a,i,b,table,L,H);
  end
  result=a;
  markresult=b;
end