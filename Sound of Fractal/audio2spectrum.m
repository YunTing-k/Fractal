%======================
clear 
close all
%======================
audio_name='Set Sail';
[data,fs]=audioread([pwd,'\Audio\',audio_name,'.mp3']);
fs=48000;
time = 5;
data=sin(2.*pi.*5000.*(0:1/fs:time))';
%======================
%先将音频信号分段 分段音频进行加窗(窗参数指定) 对加窗后的信号进行FFT
WindowLength = 100;%窗长
FFTLength = 512;%FFT点数
OverlapLength = 50;%重叠点数
FrequencyRange = 'onesided';%频率范围(单/双边带)s
win=hamming(WindowLength,'periodic');%窗函数对象
[stft_s,stft_f,stft_t]=stft(data(:,1),fs,'Window',win,'OverlapLength',OverlapLength,'FFTLength',FFTLength,'FrequencyRange',FrequencyRange);
[istft_x,istft_t]=istft(stft_s,fs,'Window',win,'OverlapLength',OverlapLength,'FFTLength',FFTLength,'FrequencyRange',FrequencyRange);
audiowrite([pwd,'\Audio\Regen-',audio_name,'.wav'],istft_x,fs)