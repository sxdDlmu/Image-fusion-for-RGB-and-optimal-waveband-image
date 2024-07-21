clc;clear;close all;
%% load data
I1 = im2double(imread("img.bmp"));
I2 = im2double(imread("single_band.bmp"));

%% FUSION
out = two_scale(I1,I2);

%% 
figure;subplot(1, 3, 1);
imshow(I1);title('rgb');
subplot(1, 3, 2);imshow(I2);title('single band');
subplot(1, 3, 3);imshow(out);title('fusion image');
