function [x]=rect(N,L)
if L>=N
    x(1,N)=1;
else
  x=zeros(1,N);
  n2=round(N/2);
  L2=floor(L/2);
  x(1,n2-L2:n2+L2)=1;
end 
end