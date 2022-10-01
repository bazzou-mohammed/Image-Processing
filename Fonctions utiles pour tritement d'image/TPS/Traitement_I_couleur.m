clear, clc, close all

%%%%%%%%%%% traitement d'images couleur%%%%%%%%%%%%
%% lecture d'image
I=imread('Lena.jpg');
figure;imagesc(I); colormap gray;  
%figure; imshow(I);
%% information sur l'image
 [m,n,p]=size(I); % m (ligne) n (colone) p(dimention du pixel)
%% composantes RVB
% R=I(:,:,1); % composante rouge
% V=I(:,:,2); % composante verte
% B=I(:,:,3); % composante bleu
% % affichage des 3 composantes R,V,B
% [m,n,p]=size(R);
% figure; 
% subplot(1,3,1); imagesc(R); colormap gray;  
% subplot(1,3,2); imagesc(V); colormap gray;
% subplot(1,3,3); imagesc(B); colormap gray;
%% affichage des pixels
I_1=zeros(m,n,p);
for i=1:m
    for j=1:n
        I_1(i,j)=I(i,j); 
    end
   figure ; imagesc(I_1);colormap gray;   
end