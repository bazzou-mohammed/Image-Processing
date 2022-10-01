function y = randlap(n, m) 
x = rand(n,m);
y = sign(0.5-x).*(1/sqrt(2)).*log(1-2.*abs(x-0.5));
end