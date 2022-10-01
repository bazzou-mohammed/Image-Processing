function [ outp ] = Pivot_180( inpu)
    dim = size(inpu);
    outp = zeros(dim(1), dim(2), 'uint8');
    for i = 1 : dim(1)
         for j = 1 : dim(2)
               outp(dim(1)+1-i, dim(2)+1-j) = inpu(i, j);
         end
    end
end

