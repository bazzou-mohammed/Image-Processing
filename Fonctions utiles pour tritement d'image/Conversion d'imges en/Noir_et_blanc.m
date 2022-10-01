function outNB = Noir_et_blanc(input)
    dim = size(input); outNB = zeros(dim(1), dim(2), 'logical');
    m = median(median(input)); % mediane des valeurs
    for i = 1 : dim(1)
       for j = 1 : dim(2)
    if input(i, j) <= m+0.13 % seuil 
       outNB(i, j) = 0;
    else
       outNB(i, j) = 255;
    end
       end
    end
end

