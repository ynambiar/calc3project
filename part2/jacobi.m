function [iterations, x, doesConverge] = jacobi(A,y,x0,tol)
    n = length(y);
    for j = 1:1:n
         x(j) = ((y(j) - A(j,[1:j-1,j+1:n]) * x0([1:j-1,j+1:n])) / A(j,j)); % the first iteration
    end
    
    for i = 1:n
        j = 1:n;
        j(i) = [];
        B = abs(A(i,j));
        Check(i) = abs(A(i,i)) - sum(B);
        if Check(i) < 0
            fprintf('The matrix is not diagonally dominant at row %2i\n\n',i)
        end
    end
    
    x1 = x';
    iterations = 0;
%     x0 = x0';
    while norm(x1 - x0,1) > tol & iterations < 100
        for j = 1:1:n
            z(j) = ((y(j) - A(j,[1:j-1,j+1:n]) * x1([1:j-1,j+1:n])) / A(j,j));
        end
        x0 = x1;
        x1 = z';
        iterations = iterations + 1;
    end
    if iterations == 100
        doesConverge = false;
    else
        doesConverge = true;
    end
    x = x1';
end