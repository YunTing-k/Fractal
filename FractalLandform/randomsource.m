function [RAND]=randomsource(~)%���Դ
%��˹�ֲ�
 Average=-2;%��˹����ƽ��ֵ
 Variance=10;%��˹��������
 RAND=normrnd(Average,Variance);

%ָ���ֲ�
%mu=5;%����
%RAND=exprnd(mu);

%٤��ֲ�
% mu=20;%����
% RAND=gamrnd(mu,1:1);

%���ηֲ�
% mu=1/100;
% RAND=geornd(mu,1,1);

%�����ηֲ�
% n=20;
% m=10;
% k=5;
% RAND=hygernd(n,k,m);

%������̬�ֲ�
%mu1=1;
%mu2=2.5;
%RAND=lognrnd(mu1,mu2);

%���ɷֲ�
% mu=1.6;
% RAND=poissrnd(mu);

%�����ֲ�
% mu=4;
% RAND=raylrnd(mu);

%Τ�����ֲ�
% mu1=1;
% mu2=8;
% RAND=wblrnd(mu1,mu2);

%���ȷֲ�
%RAND=rand;

%����
%RAND=1;
end