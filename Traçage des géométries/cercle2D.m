function cerc2d=cercle2D(Nx,Ny,R)  
cerc2d = zeros(Nx,Ny);
for i = 1:Nx
  for j = 1:Ny
    if ((Nx/2)-i)^2+((Ny/2)-j)^2<R^2
      cerc2d(i,j) = 1;
    end 
  end
end
end