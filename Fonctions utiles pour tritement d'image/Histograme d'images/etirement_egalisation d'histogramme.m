%% méthode 1 : étirement du contrast
A=imread('toureiffel_nG1.JPG'); 
figure;imshow(A);
imcontrast;
%% méthode 2 : étirement du contrast avec la fonction imadjust
% affichage de l'image et son histogramme
figure(1);
subplot(1,2,1);imshow(A);
subplot(1,2,2);imhist(A);
% étirement avec la fonction imadjust(image, [Imin_e Imax_e],[Imin_s Imax_s])
B=imadjust(A); %les intensitées max et min d'entrée  et de sortie 
figure(2);
subplot(2,2,1);imshow(B);
title('étirement avec la fonction imadjust()');
subplot(2,2,2);imhist(B);
% égalisation de l'histogramme 
C =histeq(A);
title('égalisation avec la fonction histeq()')
subplot(2,2,3);imshow(C);
subplot(2,2,4);imhist(C);
ylim([0 18000]);

