close all;clc;
f0=10; % en Hz
T0=1/f0; % en s
N=1e3; % taille du signal
t=linspace(-5*T0,5*T0,N);% axe du temps
s_t=sin(2*pi*f0*t);% sinus
plot(t, s_t,'linewidth',2)
ylabel('sin');
xlabel('temps en s');
title('espace temporel');
grid on;
%FFt
ts=t(2)-t(1); % pas d'échantillonage
fs=1/ts; % fraquence d'échantillionage
N_fft=2^14; % resolution dans le domaine frequentiel
s_fft=fft(s_t,N_fft);
f=linspace(-fs/2,fs/2,N_fft);% axe de fréquence
figure;
plot(f,abs(fftshift(s_fft)));
xlim([-10*f0 10*f0]);
xlabel('fréquence en Hz');
ylabel('|fft(sin(t)|')
title('espace fréquentiel');
grid on;
T=1;
t=-5:T/100:5;
x=1/2;
for n=1:2:1000
      x=x+(2/pi)*(1/n)*sin((n*2*pi*t)/T);
end
figure;plot(t,x,'b','linewidth',2);

  

