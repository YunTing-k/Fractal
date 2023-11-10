function [s,no]=Lsymbol(n,s,nowangle,deltaangle,p,state,law1,law2,law3)
for k=2:n
    c=randi(3);
    if(c==1)
      s=strrep(s,'F',law1);
      %s=strrep(s,'B','F[+B]F[-B]FB');
    elseif(c==2)
      s=strrep(s,'F',law2);
      %s=strrep(s,'B','F[+B]F[-B]+B');
    else
      s=strrep(s,'F',law3);
      %s=strrep(s,'B','F-[[B]+B]+F[+FB]-B');
      %s=strrep(s,'B','F[+B-B][-B+B]');
    end
end
figure;
hold on;
num=length(s);
no=5;
for k=1:length(s)
    switch(s(k))
        case 'F'%F字符:向前走一段距离并且画线
            no=no+1;
            plot([p,p+exp(1i*nowangle)],'linewidth',2,'color','k');
            p=p+exp(1i*nowangle);
        case 'G'%G字符:向前走一段距离，不画线
            p=p+exp(1i*nowangle);      
        case '|'%|字符:原地转向180°
            nowangle=nowangle+pi;            
        case '+'%逆时针旋转角度deltaangle
            nowangle=nowangle+deltaangle;
        case '-'%顺时针旋转角度deltaangle
            nowangle=nowangle-deltaangle;
        case '['%保存当前状态，最后一列对应的当前状态，倒数第二列对应的是上一个[位置的状态
            state=[state;[p,nowangle]]; %#ok<AGROW>
        case ']'%删除完成的[]对应的状态回退到上一个状态
            p=state(end,1);
            nowangle=state(end,2);
            state(end,:)=[];
        otherwise
    end
end
end