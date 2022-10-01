function [out] = expansionDynamique(inp)
   image = uint8ToDouble(inp);
   M = max(max(image));
   m = min(min(image));
   dim = size(image);
   temp = zeros(dim(1),dim(2));
   for j = 1:dim(2)
     for i = 1:dim(1)
       temp(i,j) = (image(i,j)-m)/(M-m);
     end
   end
out = doubleToUint8(temp);
end

