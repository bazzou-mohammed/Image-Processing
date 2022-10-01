function [output] = nuancesDeGris(input)
sizeinput = size(input);
if (sizeinput(3)== 3) %Si l'image est en couleurs
output = ((input(:,:,1)*0.5 + input(:,:,2)*0.25 + input(:,:,3)*0.25) / 3);
else
output = input;
end;
end

