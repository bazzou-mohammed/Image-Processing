function [ou] = pivot90(in)
dim = size(in);
dim2 = size(dim);
 if (dim2(2) == 3) % Cas ou l'image est en couleur
   ou = zeros(dim(2), dim(1), dim(3),'uint8');
    for z = 1 : dim(3)
       for i = 1 : dim(1)
         for j = 1 : dim(2)
        ou(dim(2) - j+1, i, z) = in(i, j, z);
         end
        end
    end
 else
 ou = zeros(dim(2), dim(1),'uint8');
   for i = 1 : dim(1)
     for j = 1 : dim(2)
      ou(dim(2) - j+1, i) = in(i, j);
     end
   end
  end
end
