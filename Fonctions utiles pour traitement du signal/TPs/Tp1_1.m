clear all;
subplot(3 ,1 ,1);
T=1;
t=0:T/100:5;
x=1/2;
for n=1
      x=x+(2/pi)*(1/n)*sin((n*2*pi*t)/T);
end
plot(t,x,'b');
 plot(t,x,'b');
title('n=1');
xlabel(' t ')
ylabel('x(t)')
subplot(3 ,1 ,2);
T=1;
t=0:T/100:5;
x=1/2;
for n=1:2:10
      x=x+(2/pi)*(1/n)*sin((n*2*pi*t)/T);
end
plot(t,x,'b');
 plot(t,x,'b'); 
title('n=5');
xlabel('t')
ylabel('x(t)')
subplot(3 ,1 ,3);
T=1;
t=0:T/100:5;
x=1/2;
for n=1:2:50
      x=x+(2/pi)*(1/n)*sin((n*2*pi*t)/T);
end
plot(t,x,'b');
 plot(t,x,'b'); 
 title('n=25');
xlabel('t')
ylabel('x(t)')