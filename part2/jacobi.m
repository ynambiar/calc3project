function [iterations] = jacobi(A,y,x0,tol)
    n = length(y);
    for j = 1 : n
         x(j) = ((y(j) - A(j,[1:j-1,j+1:n]) * x0([1:j-1,j+1:n])) / A(j,j)); % the first iteration
    end
    x1 = x';
    iterations = 0;
    x0 = x0';
    while norm(x1-x0,1) > tol
        for j = 1 : n
            z(j) = ((y(j) - A(j,[1:j-1,j+1:n]) * x1([1:j-1,j+1:n])) / A(j,j));
        end
        x0 = x1;
        x1 = z';
        iterations = iterations + 1;
    end
    x = x1';
end