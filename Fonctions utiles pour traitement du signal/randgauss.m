function y = randgauss(n, m, sigma)
   U1 = rand(n, m); 
   U2 = rand(n, m); 
y = sigma.*sqrt(-2.*log(U1)).*cos(2*pi*U2);
end