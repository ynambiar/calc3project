function [A] = findA1(x)

len = length(x);
A = [];
for i = 1:1:len
    a = zeros(1,len);
    a(i) = 1;
    if (i - 1) > 0
        a(i - 1) = 1;
    end
    if (i - 3) > 0
        a(i - 3) = 1;
    end
     A= [A; a];
end
end

