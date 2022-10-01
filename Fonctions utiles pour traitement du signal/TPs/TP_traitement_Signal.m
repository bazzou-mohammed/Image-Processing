clear, clc, close all
%%% TP de traitement du signal 
%% Bruit Laplacein avec la fonction avec estimation 
X=randlap(1, 1e4);
figure;
subplot(2, 1 ,1);
plot(X);title('Bruit laplacien');ylabel('Amplitude'); xlabel('nombre d échantillions')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);
ylim([-10 10])
subplot(2, 1 ,2);
hist(X, 50); title('densité de probalilité');ylabel('nombre d échantillions ');
xlim([-10 10]); xlabel('amplitude')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);
hold on
%% densité de probabilité théorique
x = randl(1, 1e4);
bins = round(sqrt(length(x)));
n = length(x);  
r = max(x) - min(x);
mu = mean(x);                                             
sigma = std(x); 
xprim = mu + linspace(-5*sigma, 5*sigma, 1000); 
fx = 1/(sqrt(2)*sigma)*exp(-sqrt(2)*abs(xprim-mu)/sigma);
binwidth = r/bins;              
area = n*binwidth;              
fx = area*fx;  
plot(xprim, 2*fx,'-r', 'LineWidth', 1.5);legend('densité estimée', 'densité théorique')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);
grid on
%% 2 Mélange signal-bruit linéaire
%% 2-1
% figure;
G = randgauss(1,1e5, 1);
% hist(G, 50);
% g=findobj(gca,'Type','patch');
% set(g,'FaceColor',[0 1 1],'EdgeColor','w')
% hold on 
% hist(G+1, 50)
% set(g,'FaceColor',[0 .5 .5],'EdgeColor','w')
% legend('densité du bruit \eta', 'densité de s+\eta')
% title('densité de probalilité');ylabel('nombre d échantillions ');xlabel('amplitude')
% set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);
% p_H0_d1=ones(size(G));
% p_H11_d1=ones(size(G));
% 
% p_H0_d2=ones(size(G));
% p_H11_d2=ones(size(G));
% 
% p_H0_d3=ones(size(G));
% p_H11_d3=ones(size(G));
% 
% p_H0_d4=ones(size(G));
% p_H11_d4=ones(size(G));
% 
% for j=1 : length(G) 
%    p_H0_d1(j)=p_H0_d1(j)*sqrt(2*pi)*(1/sqrt(2*pi))*exp(-(G(j))^2/2);
%    p_H11_d1(j)=p_H11_d1(j)*sqrt(2*pi)*(1/sqrt(2*pi))*exp(-(G(j)-1)^2/2);
% 
%    p_H0_d2(j)=p_H0_d2(j)*exp(-(G(j))^2/2*4);
%    p_H11_d2(j)=p_H11_d2(j)*exp(-(G(j)-1)^2/2*4);
%    
%    p_H0_d3(j)=p_H0_d3(j)*exp(-(G(j))^2/2*9);
%    p_H11_d3(j)=p_H11_d3(j)*exp(-(G(j)-1)^2/2*9);
%    
%    p_H0_d4(j)=p_H0_d4(j)*exp(-(G(j))^2/2*16);
%    p_H11_d4(j)=p_H11_d4(j)*exp(-(G(j)-1)^2/2*16);     
% end
% 
% figure;
% p_H0_d1 = sort(p_H0_d1);
% p_H11_d1 = sort(p_H11_d1);
% plot (p_H11_d1, p_H0_d1, 'r')
% 
% p_H0_d2 = sort(p_H0_d2);
% p_H11_d2 = sort(p_H11_d2);
% hold on 
% plot (p_H11_d2, p_H0_d2, 'y')
% 
% p_H0_d3 = sort(p_H0_d3);
% p_H11_d3 = sort(p_H11_d3);
% hold on 
% plot (p_H11_d3, p_H0_d3, 'g')
% 
% p_H0_d4 = sort(p_H0_d4);
% p_H11_d4 = sort(p_H11_d4);
% hold on 
% plot (p_H11_d4, p_H0_d4, 'b')
% xlabel('P_e_r (x/H0)'); ylabel('P_e_r (x/H1)')
% legend('\sigma = 1', '\sigma = 2', '\sigma = 3', '\sigma = 4')
% % title('densité de probalilité');
% set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);
% %% dans le cas de bruit blanc laplacien 
% figure;
% hist(X, 50);
% g=findobj(gca,'Type','patch');
% set(g,'FaceColor',[0 1 1],'EdgeColor','w')
% hold on 
% hist(X+1, 50)
% set(g,'FaceColor',[0 .5 .5],'EdgeColor','w')
% legend('densité du bruit \eta', 'densité de s+\eta')
% title('densité de probalilité');ylabel('nombre d échantillions ');xlabel('amplitude')
% set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);

% p_H0_d1_L=ones(size(X));
% p_H11_d1_L=ones(size(X));
% 
% p_H0_d2_L=ones(size(X));
% p_H11_d2_L=ones(size(X));
% 
% p_H0_d3_L=ones(size(X));
% p_H11_d3_L=ones(size(X));
% 
% p_H0_d4_L=ones(size(X));
% p_H11_d4_L=ones(size(X));
% 
% 
% for j=1: length(X)    
%    p_H0_d1_L(j)=p_H0_d1_L(j)*exp(-sqrt(2)*abs(X(j))/2);
%    p_H11_d1_L(j)=p_H11_d1_L(j)*exp(-sqrt(2)*abs(X(j)-1)/2);
% 
%    p_H0_d2_L(j)=p_H0_d2_L(j)*exp(-sqrt(2)*abs(X(j))/2*2);
%    p_H11_d2_L(j)=p_H11_d2_L(j)*exp(-sqrt(2)*abs(X(j)-1)/2*2);
%    
%    p_H0_d3_L(j)=p_H0_d3_L(j)*exp(-sqrt(2)*abs(X(j))/2*3);
%    p_H11_d3_L(j)=p_H11_d3_L(j)*exp(-sqrt(2)*abs(X(j)-1)/2*3);
%    
%    p_H0_d4_L(j)=p_H0_d4_L(j)*exp(-sqrt(2)*abs(X(j))/2*4);
%    p_H11_d4_L(j)=p_H11_d4_L(j)*exp(-sqrt(2)*abs(X(j)-1)/2*4);      
% end
% figure;
% p_H0_d1_L = sort(p_H0_d1_L);
% p_H11_d1_L = sort(p_H11_d1_L);
% plot (p_H11_d1_L, p_H0_d1_L, 'r')
% 
% p_H0_d2_L = sort(p_H0_d2_L);
% p_H11_d2_L = sort(p_H11_d2_L);
% hold on 
% plot (p_H11_d2_L, p_H0_d2_L, 'y')
% 
% p_H0_d3_L = sort(p_H0_d3_L);
% p_H11_d3_L = sort(p_H11_d3_L);
% hold on 
% plot (p_H11_d3_L, p_H0_d3_L, 'g')
% 
% p_H0_d4_L = sort(p_H0_d4_L);
% p_H11_d4_L = sort(p_H11_d4_L);
% hold on 
% plot (p_H11_d4_L, p_H0_d4_L, 'b')
% xlabel('P_e_r (x/H0)'); ylabel('P_e_r (x/H1)')
% legend('\sigma = 1', '\sigma = 2', '\sigma = 3', '\sigma = 4')
% % title('densité de probalilité');
% set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);
%% cas d'un mélange signal-bruit non linéaire avec un seuil a = 5
% bruit gaussien
% a=5;
% S_0 = 0 ;
% S_1 = 1 ;
% y_0 = sign(S_0 + (G - a));
% y_1 = sign(S_1 + (G - a));
% 
% p_H0_d1_=ones(size(y_0));
% p_H11_d1_=ones(size(y_1));
% 
% p_H0_d2_=ones(size(y_0));
% p_H11_d2_=ones(size(y_1));
% 
% p_H0_d3_=ones(size(y_0));
% p_H11_d3_=ones(size(y_1));
% 
% p_H0_d4_=ones(size(y_0));
% p_H11_d4_=ones(size(y_1));
% 
% for j=1 : length(G) 
%    p_H0_d1_(j)=p_H0_d1_(j)*exp(-(y_0(j))^2/2);
%    p_H11_d1_(j)=p_H11_d1_(j)*exp(-(y_1(j)-1)^2/2);
% 
%    p_H0_d2_(j)=p_H0_d2_(j)*exp(-(y_0(j))^2/2*4);
%    p_H11_d2_(j)=p_H11_d2_(j)*exp(-(y_1(j)-1)^2/2*4);
%    
%    p_H0_d3_(j)=p_H0_d3_(j)*exp(-(y_0(j))^2/2*9);
%    p_H11_d3_(j)=p_H11_d3_(j)*exp(-(y_1(j)-1)^2/2*9);
%    
%    p_H0_d4_(j)=p_H0_d4_(j)*exp(-(y_0(j))^2/2*16);
%    p_H11_d4_(j)=p_H11_d4_(j)*exp(-(y_1(j)-1)^2/2*16);     
% end
% 
% figure;
% plot (p_H11_d1_, p_H0_d1_, 'r')
% hold on 
% plot (p_H11_d2_, p_H0_d2_, 'y')
% hold on 
% plot (p_H11_d3_, p_H0_d3_, 'g')
% hold on 
% plot (p_H11_d4_, p_H0_d4_, 'b')
% xlabel('P_e_r (x/H0)'); ylabel('P_e_r (x/H1)')
% legend('\sigma = 1', '\sigma = 2', '\sigma = 3', '\sigma = 4')
% title('Cas de bruit gaussien');
% set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);
% % bruit laplacien 
% y_0_ = sign(S_0 + (X - a));
% y_1_ = sign(S_1 + (X - a));
% 
% p_H0_d1_L=ones(size(y_0_));
% p_H11_d1_L=ones(size(y_1_));
% 
% p_H0_d2_L=ones(size(y_0_));
% p_H11_d2_L=ones(size(y_1_));
% 
% p_H0_d3_L=ones(size(y_0_));
% p_H11_d3_L=ones(size(y_1_));
% 
% p_H0_d4_L=ones(size(y_0_));
% p_H11_d4_L=ones(size(y_1_));
% 
% 
% for j=1: length(X)    
%    p_H0_d1_L(j)=p_H0_d1_L(j)*exp(-sqrt(2)*abs(y_0_(j))/2);
%    p_H11_d1_L(j)=p_H11_d1_L(j)*exp(-sqrt(2)*abs(y_1_(j)-1)/2);
% 
%    p_H0_d2_L(j)=p_H0_d2_L(j)*exp(-sqrt(2)*abs(y_0_(j))/2*2);
%    p_H11_d2_L(j)=p_H11_d2_L(j)*exp(-sqrt(2)*abs(y_1_(j)-1)/2*2);
%    
%    p_H0_d3_L(j)=p_H0_d3_L(j)*exp(-sqrt(2)*abs(y_0_(j))/2*3);
%    p_H11_d3_L(j)=p_H11_d3_L(j)*exp(-sqrt(2)*abs(y_1_(j)-1)/2*3);
%    
%    p_H0_d4_L(j)=p_H0_d4_L(j)*exp(-sqrt(2)*abs(y_0_(j))/2*4);
%    p_H11_d4_L(j)=p_H11_d4_L(j)*exp(-sqrt(2)*abs(y_1_(j)-1)/2*4);      
% end
% figure;
% plot (p_H11_d1_L, p_H0_d1_L, 'r')
% hold on 
% plot (p_H11_d2_L, p_H0_d2_L, 'y')
% hold on 
% plot (p_H11_d3_L, p_H0_d3_L, 'g')
% hold on 
% plot (p_H11_d4_L, p_H0_d4_L, 'b')
% xlabel('P_e_r (x/H0)'); ylabel('P_e_r (x/H1)')
% legend('\sigma = 1', '\sigma = 2', '\sigma = 3', '\sigma = 4')
% title('Cas de bruit Laplacien');
% set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);

%% Estimation
% EQM : Erreur quadratique moyenne
% INF_ficher : information de Fisher 
% cas de bruit gaussien 

figure;
[biais_G, varaince_G , EQM_G]= stats(G);
plot(EQM_G); 
xlabel('N')
ylabel(' Erreur quadratique moyenne ')
title('Bruit gaussien')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);

% cas de bruit laplacien  
figure;
[biais_L, varaince_L, EQM_L]= stats(X);
plot(EQM_L); 
xlabel('N');
ylabel(' Erreur quadratique moyenne ');
title('Bruit laplacien')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);

















