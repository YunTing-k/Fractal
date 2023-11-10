function [s]=Lsymbol(n,s,nowangle,deltaangle,p,state,law)
for k=2:n
    %s=strrep(s,'B','F-[[B]+B]+F[+FB]-B');
    %s=strrep(s,'B','F[+B][-B]FB');
    %s=strrep(s,'B','F[+B][-B]FB');
    s=strrep(s,'F',law);
end
figure;
hold on;
for k=1:length(s)
    switch(s(k))
        case 'F'%F�ַ�:��ǰ��һ�ξ��벢�һ���
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
            %����
    end
end
end