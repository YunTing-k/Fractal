clear;
s='[+F]F[-F]';%初始状态F
nowangle=pi/2;%初始方向
deltaangle=pi/8;%增量角度
p=0;%初始位置
state=[0,pi/2];%当前状态
law='[+F]FF[-F][+F]';%迭代规则