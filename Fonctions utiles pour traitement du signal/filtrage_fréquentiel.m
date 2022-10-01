clear, clc, close all
for i = 1 : 5  
Nx=256;Nx2=(Nx/6)+(Nx/6)-20 ;Lx=20;Ny=256;Ny2=(Ny/6)+(Ny/6)-20;Ly=20;
% construction de l'objet rectangulaire
x(1:256)=zeros;x(Nx2-Lx:Nx2+Lx)=ones;
y(1:256)=zeros;y(Ny2-Ly:Ny2+Ly)=ones;
Oxy=x'*y;
%calcul de la TF
Suv=fft2(Oxy);Suv=fftshift(Suv);
figure,imagesc(abs(Suv)),colorbar,title('densit� spectrale de l�objet dans le plan de Fourier')
%Filtrage spatial
[X,Y] = ginput(2);display('cliquer sur le coin superieur gauche du rectangle que vous voulez supprimer ensuite sur le coin inf�rieur droit');
X=round(X);Y=round(Y);
Suvf=Suv;
Suvf(Y(1):Y(2),X(1):X(2))=ones;
%calcul de l'image non filtr�e
Ixy=abs(ifft2(Suv));
figure,imagesc(abs(Ixy)),colorbar,title('image de l objet non filtr�e')
%calcul de l'image filtr�e
Ixyf=abs(ifft2(Suvf));
figure,imagesc(abs(Ixyf)),colorbar,title('image de l objet filtr�e')
hold on;    
end