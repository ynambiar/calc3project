function [x] = decoding(y)
    y = str2num(y);
    len = length(y);
    y0 = {};
    y1 = {};
    for i = 1:1:len
        str = num2str(y(i));
        if length(str) == 2
            y0{i} = str(1);
            y1{i} = str(2);
        elseif length(str) == 1
            y0{i} = '0';
            y1{i} = str(1);
        end
    end
    
    y0 = str2double(y0);
    y1 = str2double(y1);
    
    x0 = zeros(1, len);
    A0 = findA0(x0);
    
    %find x through iterative method
    tol = 0.00000001;
    [iterations, x] = jacobi(A0,y0,x0',tol);
    n = length(x);
    for i = 1:1:n
        x(i) = mod(x(i), 2);
    end
    
    %remove bucket 0's
    x = x(:, 1:n-3);
    
end