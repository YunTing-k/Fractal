%======================
clear 
close all
%======================
img_name = 'h';%图片名字
img_type = 'png';%图片类型
img = imread([pwd,'\Image\',img_name,'.',img_type]);
gray = rgb2gray(img);%灰度图
imwrite(gray,'灰度图.png')
%======================
fs = 48000;%采样率
traget_time = 20;%目标时间(秒)
traget_max_frequency = 8000;%目标最大频率
traget_min_frequency = 500;%目标最小频率
target_amp = 1.0;%目标最大振幅
img_amp = 1;%图像增强幅度
WindowLength = 4000;%窗长
OverlapLength = 2000;%重叠点数
FrequencyRange = 'onesided';%频率范围(单/双边带)
traget_seq_len=fs * traget_time;%目标恢复时间序列长度
% win = rectwin(WindowLength);
win=hamming(WindowLength,'periodic');%窗函数对象
if_const_fftlength =true;%是否FFT点数恒定
const_fftlength =2^17;%恒定FFT点数
%======================
gray = gray*(255/max(max(gray)));%图像均衡
gray = gray*img_amp;%图像增强
imwrite(gray,'均衡灰度图.png')
[data_w,data_l]=size(gray);%灰度图尺寸
data = [zeros(round(data_w*(fs/2-traget_max_frequency)/(traget_max_frequency-traget_min_frequency)),data_l,'uint8');
    gray;
    zeros(round(data_w*traget_min_frequency/(traget_max_frequency-traget_min_frequency)),data_l,'uint8')];
%*255;%补零进行频率对齐
[data_w,data_l]=size(data);
imwrite(data,'补零.png')
if strcmp(FrequencyRange,'onesided')
    if if_const_fftlength==true
        FFTLength = const_fftlength;
    elseif if_const_fftlength==false
        if(fix(log2(2*data_w-2))>15)
            FFTLength = 32768;
        else
            FFTLength = 2^(fix(log2(2*data_w-2)));
            %         FFTLength = 32768;
        end
    end
    new_data_w = FFTLength/2+1;
elseif strcmp(FrequencyRange,'twosided')
    if if_const_fftlength==true
        FFTLength = const_fftlength;
    elseif if_const_fftlength==false
        if(fix(log2(2*data_w-2))>15)
            FFTLength = 32768;
        else
            FFTLength = 2^(fix(log2(data_w)));
            %         FFTLength = 32768;
        end
    end
    new_data_w = FFTLength;
end
peroid_num = fix((traget_seq_len-OverlapLength)/(WindowLength-OverlapLength));%序列段数
new_data_l = peroid_num;
data = flipud(imresize(data,[new_data_w,new_data_l],'nearest'));
imwrite(flipud(data),'拉伸.png')
data = double(data);
[istft_x,istft_t]=istft(data,fs,'Window',win,'OverlapLength',OverlapLength,'FFTLength',FFTLength,'FrequencyRange',FrequencyRange);
% stft(istft_x,fs,'Window',win,'OverlapLength',OverlapLength,'FFTLength',FFTLength,'FrequencyRange',FrequencyRange);%显示频谱图
%======================
if ((img_name)>='a'&&(img_name<='z'))
    istft_x = istft_x(fix(0.5*fs):end);%去除前0.5s的信号
    audio = target_amp.*istft_x/max(abs(istft_x));
    audiowrite([pwd,'\Audio\',img_name,'.wav'],audio,fs)
else
    istft_x = istft_x(fix(0.1*fs):end);%去除前0.5s的信号
    audio = target_amp.*istft_x/max(abs(istft_x));
    audiowrite([pwd,'\Audio\',img_name,'.wav'],audio,fs)
end



