function L = gaussienne(NX,NY,rc,px)
L(1:NY,1:NX)=0;
sigma = sqrt(-rc^2/(2*log(0.5)));
for i=1:NX
  for j =1:NY
L(i,j)=exp(-((NX/2-i)**2+(NY/2-j)**2)/(2*sigma^2));
  end
 end
 end