function [y] = encoding(n)
    n = str2num(n);
    originalX = randi([0 1],1, n);

%     originalX = [1 0 1 1 0 ]; %test case 1
%     originalX = [1 0 1 1 1 0 1 1 1 0 0 0 1 0]; %test case 2
    x = [originalX 0 0 0]; %to account for 3 buckets in shift register
    
    %find A0 and A1
    x = x';
    A0 = findA0(x);
    A1 = findA1(x);
    lenx = size(x);
    lenofA0 =size(A0);
    lenofA1 = size(A1);
    
    %find y0 ad y1
    y0 = multMatrix(A0, x);
    y1 = multMatrix(A1, x);
    
    %make y0 and y1 binary
    for i = 1:1:length(y0)
        y0(i) = mod(y0(i), 2);
        y1(i) = mod(y1(i), 2);
    end
    
    
    %multiplex y0 and y1 to create y
    y0 = y0';
    y1 = y1';
    y0 = num2cell(y0);
    y1 = num2cell(y1);
    y = [];
    
    for i = 1:1:n+3
          str = [y0{i} y1{i}];
          str = num2str(str);
          str(2:3) = [];
          y = [y ' ' str];
    end 
end


