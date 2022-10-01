clear all; clc;
%%% fonctions usuels dans le traitement du signal

%% fonction signe
t=-8:0.01:8;    % axe du temps
u=sign(t);      
plot(t,u,'linewidth',2); 
grid on ;
title('fonction signe')
xlabel('t');
ylabel('sgn(t)');
%% paramètres
fs=250*10^3; % fréquence d'echantillonage
dt=1/fs;    % pas d'échantillonage
t=-5*10^-3:dt:5*10^-3; %l'axe du temps 
T=10^-3;  % période
%% signaux sinusoidaux
a1=cos(pi*t/T);a2=sin(pi*t/T);
figure;
plot(1000*t,a1,'linewidth',2);hold on;grid on;
plot(1000*t,a2,'linewidth',2);
xlabel('temps','fontsize',16);ylabel('cos et sin','fontsize',16);
legend('cos','sin');
%% sinus cardinal
b=sinc(t/T);
figure;
plot(1000*t,b,'linewidth',2);
title('sinus cardinal');
xlabel('temps');
ylabel('sinc');
grid on;
%% échellon unité 
d=(t>=0);
figure; plot(1000*t,d,'linewidth',2);
%title('échelon (t)')
xlabel('t');
ylabel('echelon(t)');
grid on;
%% impulsion de dirac
c=(t==0);
figure;stem(1000*t,c,'linewidth',2)
%title('impulsion de dirac');
xlabel('t');
%ylabel('delta(t)');
grid on;
%% fonction rectangulaire
x=(abs(t)==T);
figure;plot(1000*t,x,'linewidth',2)
title('foction rectangulaire');
xlabel('t');
ylabel('rect(t)');
ylim([-1 2])
grid on;

%% fonction rectangulaire
figure;
t1=-2:0.01:-0.5;
t2=-0.5:0.01:0.5;
t3=0.5:0.01:2;
t=[t1 t2 t3];
x1=zeros(size(t1));
x2=ones(size(t2));
x3=zeros(size(t3));
x=[x1 x2 x3];
plot(t, x,'linewidth',2);
xlabel('t');
ylabel('rect(t)');
grid;
%% fonction triangulaire
figure;
t=-2:0.001:2;
r=tripuls(0.5*t);
plot(t,r,'linewidth',2);
xlabel('t');
ylabel('tri(t)');
grid;
%%
