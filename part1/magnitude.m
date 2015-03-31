function [mag] = magnitude(x)
    sum = 0;
    for i = [1:length(x)]
        sum = sum + x(i)^2;
    end
    mag = sqrt(sum);

end