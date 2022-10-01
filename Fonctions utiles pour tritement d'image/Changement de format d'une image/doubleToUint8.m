function [output] = doubleToUint8(input)
    output = uint8(floor(255*input));
end

