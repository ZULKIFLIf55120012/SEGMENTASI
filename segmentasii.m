clc; clear; close all; warning off all;
 
% Membaca citra asli
Img = imread('as.png');

% Melakukan transformasi ruang warna citra yang semula RGB menjadi HSV
HSV = rgb2hsv(Img);

% Melakukan segmentasi terhadap warna biru (nilai Hue 100-250)
H = HSV(:,:,1);
range = [100 250]/360; 
mask = (H>range(1)) & (H<range(2));

% 1. Mengubah warna background menjadi grayscale
H = HSV(:,:,1);
S = HSV(:,:,2);
V = HSV(:,:,3);
 
V = V.*mask;
HSV1 = cat(3,H,S,V);
 
RGB1 = hsv2rgb(HSV1);


subplot(1,4,1),imshow(Img), title ('Citra asli');
subplot(1,4,2),imshow(im2uint8(HSV)), title ('Citra HSV');
subplot(1,4,3),imshow(im2uint8(mask)), title ('Citra MASK');
subplot(1,4,4),imshow(im2uint8(RGB1)), title ('Citra Hasil');