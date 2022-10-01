clc;close all;
T=1; %période 
t=-2:T/100:2;
x=1/2;
for n=1:2:1000
      x=x+(2/pi)*(1/n)*sin((n*2*pi*t)/T);
end
plot(t,x,'linewidth',2);
xlabel('t');
ylabel('x(t)');
grid;