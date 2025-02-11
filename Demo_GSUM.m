%% This code belongs to the following paper:
% Manar, A. A., & Zohair, A. A. (2024). SHARPNESS IMPROVEMENT OF MAGNETIC RESONANCE IMAGES USING A GUIDED-SUBSUMED UNSHARP MASK FILTER. 
% Applied Computer Science, 20(4), 192-210.
% https://doi.org/10.35784/acs-2024-47

close all; clear all; clc;

img =imread('5.jpg');
img=im2double(img(:,:,1));
img_Var=var(img(:));
eps = 0.2^2; 
tic;
q= guidedfilter(img, img,eps);
I2=(img-q);
total_diff=Diff(img);
lambda=exp(-img_Var)./(0.18+total_diff); 
I4=img+lambda.*I2;
toc;
figure;imshow([img,I4])