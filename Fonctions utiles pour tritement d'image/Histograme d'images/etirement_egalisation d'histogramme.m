%% m�thode 1 : �tirement du contrast
A=imread('toureiffel_nG1.JPG'); 
figure;imshow(A);
imcontrast;
%% m�thode 2 : �tirement du contrast avec la fonction imadjust
% affichage de l'image et son histogramme
figure(1);
subplot(1,2,1);imshow(A);
subplot(1,2,2);imhist(A);
% �tirement avec la fonction imadjust(image, [Imin_e Imax_e],[Imin_s Imax_s])
B=imadjust(A); %les intensit�es max et min d'entr�e  et de sortie 
figure(2);
subplot(2,2,1);imshow(B);
title('�tirement avec la fonction imadjust()');
subplot(2,2,2);imhist(B);
% �galisation de l'histogramme 
C =histeq(A);
title('�galisation avec la fonction histeq()')
subplot(2,2,3);imshow(C);
subplot(2,2,4);imhist(C);
ylim([0 18000]);

