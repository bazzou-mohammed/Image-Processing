clear, clc, close all
I=im2double(imread('IsSeedGerm.tif'));
figure;imagesc(I); title('image originale')
G=rgb2gray(I);
figure;imagesc(G); colormap gray ; title('nuance de gris');
fft=fft2(G);
ff_sh=fftshift(fft);
K=log(abs(ff_sh));
figure;imagesc(K); colormap gray; title('transform�e de fourier')
%% mask of low frequences
mask = zeros(88,110); % on annule les hautes fr�quences 
mask(30:60, 40:72) = 1 ; % on garde que les basses fr�quences 
figure ;imagesc(K.*mask); colormap gray;colorbar;title('mask des hautes fr�quences');
%% reconstruction de l'image en basses fr�quences 
ifft=ifft2(K.*mask);
figure; imagesc(abs(ifft)); colormap gray; colorbar;