%======================================%
% MCNN构造谢尔宾斯基三角
%======================================%
clear
close all;
img = imread('img1.jpg');
img = rgb2gray(img);
img =  imresize(img,[1000,1000]);
img_size = size(img);
%======================================%
iteration_time = 10;
col_num = 5;
if (mod(iteration_time,col_num)==0)
    row_num = iteration_time / col_num;
else
    row_num = round(iteration_time / col_num) + 1;
end
img_display = zeros(img_size(1) * row_num,img_size(2) * col_num,'uint8');
img_display(1:img_size(1),1:img_size(2)) = img;
img_out = img;
for i = 2:iteration_time
    tmp = imresize(img_out,[round(img_size(1) / 2), round(img_size(2) / 2)]);
%     imshow(tmp)
    img_out = 255 * ones(img_size(1),img_size(2),'uint8');
    img_out(round(img_size(1) / 2)+1 : img_size(1),1:round(img_size(2) / 2)) = tmp;
    img_out(round(img_size(1) / 2)+1 : img_size(1),round(img_size(2) / 2)+1 : img_size(2)) = tmp ;
    img_out(1:round(img_size(1) / 2),round(img_size(2) / 4)+1 : round(img_size(2) * 3 / 4)) = tmp;
    col = mod(i,col_num);
    if col == 0
        col = col_num;
    end
    if (mod(i,col_num)==0)
        row = i / col_num;
    else
        row = fix(i / col_num) + 1;
    end
    img_display((row-1)*img_size(1)+1:row*img_size(1),(col-1)*img_size(2)+1:col*img_size(2)) = img_out;
end
figure
imshow(img_display)
imwrite(img_display,'img_display.png')