clear;
%s='F--F--F';%初始状态F
s='F--F++F';%初始状态F
nowangle=pi/2;%初始方向
deltaangle=pi/7;%增量角度
p=0;%初始位置
state=[0,pi/2];%当前状态
law1='F-F++F-F';%迭代规则1
law2='F+F--F+F';%迭代规则2
law3='F+F';%迭代规则3
% law1='F-F++-F';%迭代规则1
% law2='F+F--+F';%迭代规则2
% law3='F++F-';%迭代规则3