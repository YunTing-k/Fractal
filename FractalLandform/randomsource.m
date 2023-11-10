function [RAND]=randomsource(~)%随机源
%高斯分布
 Average=-2;%高斯噪声平均值
 Variance=10;%高斯噪声方差
 RAND=normrnd(Average,Variance);

%指数分布
%mu=5;%参数
%RAND=exprnd(mu);

%伽马分布
% mu=20;%参数
% RAND=gamrnd(mu,1:1);

%几何分布
% mu=1/100;
% RAND=geornd(mu,1,1);

%超几何分布
% n=20;
% m=10;
% k=5;
% RAND=hygernd(n,k,m);

%对数正态分布
%mu1=1;
%mu2=2.5;
%RAND=lognrnd(mu1,mu2);

%泊松分布
% mu=1.6;
% RAND=poissrnd(mu);

%瑞利分布
% mu=4;
% RAND=raylrnd(mu);

%韦布尔分布
% mu1=1;
% mu2=8;
% RAND=wblrnd(mu1,mu2);

%均匀分布
%RAND=rand;

%常数
%RAND=1;
end