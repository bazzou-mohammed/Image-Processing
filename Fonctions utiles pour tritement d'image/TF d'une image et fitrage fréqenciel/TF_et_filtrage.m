clear, clc, close all
I=im2double(imread('IsSeedGerm.tif'));
figure;imagesc(I); title('image originale')
G=rgb2gray(I);
figure;imagesc(G); colormap gray ; title('nuance de gris');
fft=fft2(G);
ff_sh=fftshift(fft);
K=log(abs(ff_sh));
figure;imagesc(K); colormap gray; title('transformée de fourier')
%% mask of low frequences
mask = zeros(88,110); % on annule les hautes fréquences 
mask(30:60, 40:72) = 1 ; % on garde que les basses fréquences 
figure ;imagesc(K.*mask); colormap gray;colorbar;title('mask des hautes fréquences');
%% reconstruction de l'image en basses fréquences 
ifft=ifft2(K.*mask);
figure; imagesc(abs(ifft)); colormap gray; colorbar;