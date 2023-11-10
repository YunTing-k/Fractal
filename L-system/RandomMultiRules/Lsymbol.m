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
        case 'F'%F�ַ�:��ǰ��һ�ξ��벢�һ���
            no=no+1;
            plot([p,p+exp(1i*nowangle)],'linewidth',2,'color','k');
            p=p+exp(1i*nowangle);
        case 'G'%G�ַ�:��ǰ��һ�ξ��룬������
            p=p+exp(1i*nowangle);      
        case '|'%|�ַ�:ԭ��ת��180��
            nowangle=nowangle+pi;            
        case '+'%��ʱ����ת�Ƕ�deltaangle
            nowangle=nowangle+deltaangle;
        case '-'%˳ʱ����ת�Ƕ�deltaangle
            nowangle=nowangle-deltaangle;
        case '['%���浱ǰ״̬�����һ�ж�Ӧ�ĵ�ǰ״̬�������ڶ��ж�Ӧ������һ��[λ�õ�״̬
            state=[state;[p,nowangle]]; %#ok<AGROW>
        case ']'%ɾ����ɵ�[]��Ӧ��״̬���˵���һ��״̬
            p=state(end,1);
            nowangle=state(end,2);
            state(end,:)=[];
        otherwise
    end
end
end