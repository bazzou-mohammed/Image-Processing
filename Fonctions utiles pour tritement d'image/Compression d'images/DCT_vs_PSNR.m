clear, clc, close all
%%%%%% compression d'images %%%%%% 
%%
L=imread('Lena.jpg'); % Lecture de l'image
figure (1); imagesc(L);colormap(gray);  % ouverture de l'image
DCT=dct2(L);   % transformation en cosinus 2D discret de l'image 
figure (2);imagesc(log(abs(DCT)));colormap jet; colorbar; 
title('spectre d amplitude de l image de lena')
%% mask 
taille = 360;   % mask de taille 50*50
mask = zeros(512,512); % on annule les hautes fréquences 
mask(1:taille,1:taille) = 1 ; % on garde que les basses fréquences 
figure (3);imagesc(log(abs((DCT.*mask)))); colormap gray;colorbar;
daspect([1,1,1]) % pour encadrer les basses fréquences
title('masque de taille 50 × 50')
%% recostruction de l'image comprissée à l'aide de la DCT inverse 
IDCT=idct2(DCT.*mask);
figure (4);imagesc(IDCT); colormap gray;colorbar;
%title('image de Lena avec (PSNR=40 dB)')
title('reconstruction d image en basses fréquences')
%% mesure de la qualité de compression 
Max_NG_x=max(double(L( : ))); % maximum des NG
D=(double(L( : ))-IDCT( : )).^2;% double pour changer le format de L
M=mean(D( : )); 
PSNR=10*log10((Max_NG_x)^2/M); % qualité de l'image reconstruite
%% taux de compression
tau=100*(1-(taille/512)^2);
%% Evolution du PSNR en fonction du taux de compression PSNR=f(tau)
PSNR_seq=[24.3265,27.9861,30.6115,33.1885,35.3185,37.3399,39.3245,41.3894,44.2417,51.3077]; %taille £[50;500] 
tau_seq=[99.0463,96.1853,91.4169,84.7412,76.1581,65.6677,53.2700,38.9648,22.7524,4.6326];
figure (5) ;plot(tau_seq,PSNR_seq);
ylabel('PSNR(dB)');
xlabel('taux de compression en (%)');
title('évolution du PSNR en fonction du taux de compression')
grid on;
%% Qualité visuelle 
mean_x=mean(double(L( : ))); % moyenne de l'image initiale 
mean_y=mean(IDCT( : )); % moyenne de l'image compressée
mean_xy=mean(double(L( : )).*IDCT( : )); % moyenne de produit 
mean_xx = mean(double(L( : )).*double(L( : ))); % moyenne du carré  
mean_yy = mean(IDCT( : ).*IDCT( : )); 
%% Evolution du SSIM en fonction du taux de compression
SSIM=(4.*(mean_xy - mean_x.*mean_y).*mean_x.*mean_y)/((mean_xx -(mean_x)^2 + mean_yy -(mean_y)^2).*((mean_x)^2 + (mean_y)^2));
SSIM_seq=[0.9492,0.9787,0.9885,0.9937,0.9961,0.9976,0.9985,0.9990,0.9995,0.9999];
figure (6) ;plot(tau_seq,SSIM_seq);
ylabel('SSIM');
xlabel('taux de compression en (%)');
title('évolution du SSIM en fonction du taux de compression')
grid on;




