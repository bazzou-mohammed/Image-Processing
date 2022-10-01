function [z]=rect2(Nx,Lx,Ny,Ly)  
z(1:Ny,1:Nx)=0;
ny2=round(Ny/2)+1; 
ly2=round(Ly/2); 
nx2=round(Nx/2)+1; 
lx2=round(Lx/2);
z(ny2-ly2:ny2+ly2,nx2-lx2:nx2+lx2)=1; 
end
% Nx : taille de l'axe x
% Ny : taille de l'axe y
% Lx : Longeur de la porte selon x
% Ly : Longeur de la porte selon y