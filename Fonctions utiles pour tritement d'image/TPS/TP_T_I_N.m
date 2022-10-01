clear, clc, close all
% lecture d'image
% I=imread('R1-1.tif');
% figure;imagesc(I);  
% %figure; imshow(I);
% %% information sur l'image
% %  [m,n,p]=size(I); % m (ligne) n (colone) p(dimention du pixel)
% % composantes RVB
% R=I(:,:,1); % composante rouge
% V=I(:,:,2); % composante verte
% B=I(:,:,3); % composante bleu
% figure;
% subplot(1,3,1); imagesc(R); colormap gray;  
% subplot(1,3,2); imagesc(V); colormap gray;
% subplot(1,3,3); imagesc(B); colormap gray;
% D_1=V+2*R;
% D_2=R-V;
% figure; imagesc(D_1); colormap gray;
% figure; imagesc(D_2); colormap gray;
% BW = Noir_et_blanc(D_1);figure;imagesc(BW);colormap gray;
% BW_1 = Noir_et_blanc(D_2);figure;imagesc(BW_1);colormap gray;
%%
% I= unit8(zeros(300, 400, 3));
% Mask1=unit8(zeros(300, 400));
% 
% for frame=1: 1:40
%     [I(:, :, :, frame), map]= imread('R1-1.tif', frame);
%     subplot(331); imshow(I(:, :, :, frame), map), title ('image RGB');
%     I_G =[I(:, :, :, frame), map];
%     subplot(332); imshow(I_G) ;title ('canal Green');
%     IG_th =imbinarize(I_G);
%     subplot(333); imshow(IG_th) ;title ('banarisation');
%     
%     
%     [Mask1 (:, : ,frame), map]=imread('R1-1_Mask.tif',frame);
%     subplot(334); imshow(Mask1(:, :, frame), map) ;title ('mask sur fiji');
%   mask1=inv(double (Mask1(:, :, frame)));
%   ImG=(IG_th) & (~ (Mask1(:, :, frame)));
%   subplot(335); imshow(ImG) ;title ('surface');  
% end
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







