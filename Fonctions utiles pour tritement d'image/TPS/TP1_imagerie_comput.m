clear, clc, close all
%% TP1 imagerie computationnelle Restoration et reconstruction d'image %%
% Affichage de l'image
C = im2double(imread('cameraman.BMP')); % Lecture de l'image
figure; 
subplot(221); imshow(C,[]); axis off; title('Image Original');  % ouverture de l'image
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);
%% Floutage de l'image 
h = fspecial('gaussian',15,2); 
y_blur = imfilter(C,h,'conv','circular');
noise = 0.001*randn(size(C));
g = y_blur+noise;
subplot(223);imshow(y_blur,[]);
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);
title('Image Floutée');
subplot(224); imshow(g,[]);
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);
title('image floutée + bruit');
subplot(222); imshow(h,[]);axis on;
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);
title('Flou');
% Filtre Inverse
K=fspecial('gaussian',size(C),2); 
fft_o=fft2(C);
fft_fl=fft2(y_blur);
H=fftshift(fft2(K));
G=fftshift(fft2(g));
figure;
subplot(221); imshow(log(abs(fftshift(fft_o))), []);title('F(u, v)')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);
subplot(222); imshow(log(abs(H)), []);title('H(u, v)')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);
subplot(223); imshow(log(abs(fftshift(fft_fl))), []);title('H(u, v).F(u, v)')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);
subplot(224); imshow(log(abs(G)), []);title('G(u, v)')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);
R=70;
F = zeros(size(C));
for i=1 : size(C, 1)
    for j=1 : size(C, 2)
        x= i - size(C, 1)/2;
        y= j - size(C, 2)/2;
        if (x^2 + y^2<= R^2)
            F(i, j) = G(i, j)/H(i, j);
        end     
    end
end
figure; imshow(log(abs(F)),[]);title('G(u, v)/(H(u, v))')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);
filter_ivr = real(ifftshift(ifft2(F)));
figure; imshow(filter_ivr, []);
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);
title('Filtre inverse');
% Filtre de Weiner
noise_var = var(noise(:));
estimated_nsr = noise_var / var(C(:));
wnr3 = deconvwnr(g,K , estimated_nsr);
figure, imshow(wnr3);
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);
title('Filtre de Weiner ');
%% Image de base + bruit gaussien 
B_G = imnoise(C, 'gaussian');
figure; 
subplot(221);imshow(B_G,[]);title('Image original + bruit gaussien');
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);
% filtre inverse
g1 = y_blur + B_G;
subplot(222);imshow(g1,[]);title('Image avec bruit gaussien + flou ');
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);
fft_b=fftshift(fft2(B_G));
G1=fftshift(fft2(g1));
F1 = zeros(size(C));
R1=30;
for i=1 : size(C, 1)
    for j=1 : size(C, 2)
        x= i - size(C, 1)/2;
        y= j - size(C, 2)/2;
        if (x^2 + y^2<= R1^2)
            F1(i, j) = G1(i, j)/H(i, j);
        end     
    end
end
% figure; imshow(log(abs(F1)),[]);title('G(u, v)/(H(u, v))')
% set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);
filter_ivr1 = real(ifftshift(ifft2(F1)));
subplot(223); imshow(filter_ivr1, []);
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);
title('Filtre inverse');
% filtre de weiner
noise_var1 = var(B_G(:));
estimated_nsr = noise_var1 / var(C(:));
wnr3_1 = deconvwnr(g1,K , estimated_nsr);
subplot(224), imshow(wnr3_1);
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);
title('Filtre de Weiner ');
% transformée de Radon 
% Lecture de l'image de Shepp Logan
P = phantom('Modified Shepp-Logan');
figure;
subplot(1,3,1);imshow(P,[]); colormap gray;axis off;title('Shepp Logan');
theta = 0:10:179;
TR=radon(P,theta); %Transformée de Radon 
subplot(1,3,2); imshow(TR, []);title('Transformée de Radon pour \theta = 0:10:179');
% transformée inverse de Radon 
ITR=iradon(TR,theta);
subplot(1,3,3),imshow(ITR);title('Transformée inverse de Radon');
% Transformée de Radon sur les images radiographie de graines
% Affichage de l'image
with_def = rgb2gray(im2double(imread('defects.JPG'))); % Lecture de l'image
No_def = rgb2gray(im2double(imread('NO_defects.JPG'))); 
figure;
subplot(221);imshow(with_def);title('avec défaut');
subplot(222);imshow(No_def);title('sans défaut');
theta = 0:1:179;
tf_R_w=radon(with_def, theta);
tf_R_N=radon(No_def,theta);

itf_R_w=iradon(tf_R_w,theta);
itf_R_N=iradon(tf_R_N,theta);


subplot(223);imshow(tf_R_w,[]);title('T R de la graine avec défaut');
subplot(224);imshow(tf_R_N,[]);title('T R de la graine sans défaut');
figure;
subplot(121);imshow(itf_R_w,[]);title('Transformée^-1  avec defaut');
subplot(122);imshow(itf_R_N,[]);title('Transformée^-1 sans défaut');









