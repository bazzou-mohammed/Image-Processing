clear, clc, close all
%% HANDS ON 6
% comparaison d'un filtre lineaire spatial, frequentiel et non linéaire
H=double(imread('holmes_nb.bmp'));
figure (1);imagesc(H);colormap gray;colorbar;
% addition du bruit 'salt & pepper' de variance =0.5
B_I=imnoise(H,'salt & pepper',0.5);
figure (2)
subplot(1,2,1);imagesc(H);colormap gray;colorbar;title('image initiale');
subplot(1,2,2);imagesc(B_I);colormap gray;colorbar;title('image bruitée');
%% filtrage linéaire passe-bas par convolution dans le domaine spacial 
T_fitre=5;
mask = 1/(T_fitre)^2.*ones(T_fitre,T_fitre);
Filt_2=filter2(mask,B_I, 'same');
figure (3)
imagesc(Filt_2); colormap gray; colorbar; 
title('image filtree dans domaine spatial');
%% filtrage linéaire passe-bas par convolution dans le domaine fréquentiel
TF=fft2(B_I);
TF_P=fft2(mask,size(B_I,1),size(B_I,2));
P=fft2(TF.*TF_P);
figure (4)
imagesc(abs(P)); colormap gray; colorbar; 
title('image filtree dans domaine frequentiel');
%% filtrage médian non linéaire
F_M= medfilt2(B_I,[T_fitre T_fitre]);
figure (5);
imagesc(F_M); colormap(gray); colorbar; 
title('image filtree par filtre NL median');






