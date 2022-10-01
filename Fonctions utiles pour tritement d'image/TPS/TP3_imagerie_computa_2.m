clear, clc, close all
I = rgb2gray(im2double(imread('51.jpg')));
J = rgb2gray(im2double(imread('95.jpg')));
BW = im2bw(I,0.8);
BN = im2bw(J,0.9);
figure(1); subplot(321); imshow(I, []); colormap gray ; title('5')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);
subplot(322); imshow(J, []); colormap gray ; title('9')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);
%% Ordre 0
subplot(323); imshow(BW, []); colormap gray; title('Seuillage de 5');
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);
subplot(324); imshow(BN, []); colormap gray ; title('Seuillage de 9')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);
rect_0 = [750 500 170 170];
imacrop = imcrop(BN,rect_0);
imcr = imcrop(BW, rect_0); 
b = imfill(imacrop, 1);
a = imfill(imcr, 1);
subplot(325); imshow(a, []); title('Crop de 5')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);
subplot(326); imshow(b, []); title('Crop de 9')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);
%% Ordre "1"
figure(2); 
subplot(221); imshow(I, []); colormap gray ; title('crop de 5')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);
subplot(222); imshow(J, []); colormap gray ; title('crop 9')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);
rect_1 = [540 490 170 170];
ima_1 = imcrop(I,rect_1);
ima_2 = imcrop(J,rect_1);
subplot(223); imshow(ima_1, []); colormap gray ; title('crop de 5')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);
subplot(224); imshow(ima_2, []); colormap gray ; title('crop de 9')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);

%% Ordre "0" pour tous les images 
for i=1:8
  % pour les "5"
  IM5 = '5';   % pour afficher et binariser les "5"   
  jpgfiles5 = dir(fullfile(IM5, '/*.jpg*'));
  im5 = jpgfiles5(i).name;
  im1 = im2double(imread(fullfile(IM5,im5)));
  % Binarisation et crop
  bw = im2bw(im1,0.8);
  rect = [740 490 170 170]; 
  cropped = imcrop(bw,rect);
  croppede = imfill(cropped,1);
%   figure(3); imshow(croppede, []); 
  
  % "9"
  IM9 = '9';   
  jpgfiles9 = dir(fullfile(IM9, '/*.jpg*'));
  im9 = jpgfiles9(i).name;
  im2 = im2double(imread(fullfile(IM9, im9)));
  
  % binarisation et crop   
  bw1 = im2bw(im2, 0.9);
  cropped1 = imcrop(bw1, rect);
  croppede1 = imfill(cropped1, 1);
%   figure(4); imshow(croppede1, []); 
  
%% Ordre "1" pour tous les images de :
%%  "5"
 rect_1 = [540 490 170 170];
 imacrop_15 = rgb2gray(imcrop(im1, rect_1));
%  figure(5); imshow(bw_1, []);

%  "9"
 imacrop_19 = rgb2gray(imcrop(im2,rect_1)); 
%  figure(6); imshow(imacrop_19);

% Entropie locale pour le calcule de circularité 
 c = rangefilt(croppede); 
 d = rangefilt(croppede1);
%  figure(7);
%  subplot(121), imshow(c, []), 
%  set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);
%  subplot(122),imshow(d, []),
%  set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);

% Circulrité pour "5"
 p1 = bwconncomp(croppede);
 p11 = cell2mat(struct2cell(regionprops(p1,'Perimeter')));
 Ar1 = cell2mat(struct2cell(regionprops(p1,'Area')));
 C1 = (4*pi)*(Ar1./(p11)^2);
 %% Circulrité pour "9"
 p2 = bwconncomp(croppede1);
 p22 = cell2mat(struct2cell(regionprops(p2,'Perimeter')));
 Ar2 = cell2mat(struct2cell(regionprops(p2,'Area')));
 C2 = (4*pi)*(Ar2(1)./(p22(1))^2);
 %% Variance du spectre 
 aa=sum(croppede,1); % spectre de 5 
 aa1=var(aa);  % variance de 5 
 bb=sum(imacrop_19,1); % spectre de 9 
 bb1=var(bb); % variance de 9 
 %% euler number
 euler_num_05 = bweuler(croppede);
 euler_num_09 = bweuler(croppede1);
%% represesentation des descripteurs en 3D
 figure(8)
 plot3(C1, aa1, max(aa),'o');
 hold on 
 plot3(C2, bb1, max(bb),'*');
 title('représentation des features'),xlabel('Circularité'),ylabel('Variance'),zlabel('Amplitude Max'),legend('5','9') 
 set(gca, 'FontName', 'Times New Roman', 'FontSize', 10); 
end 







