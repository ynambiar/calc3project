function [iterations, x, doesConverge] = gauss_seidel(A,y,x0,tol)
    n = length(y);
    error = ones(n,1);
    for i = 1:n
        j = 1:n;
        j(i) = [];
        B = abs(A(i,j));
        Check(i) = abs(A(i,i)) - sum(B);
        if Check(i) < 0
            fprintf('The matrix is not diagonally dominant at row %2i\n\n',i)
        end
    end

    iterations = 0;
    while max(error) > tol & iterations < 100
        iterations = iterations + 1;
        Z = x0;
        for i = 1:n
            j = 1:n; 
            j(i) = [];
            xtemp = x0;
            xtemp(i) = [];
            x0(i) = (y(i) - sum(A(i,j) * xtemp)) / A(i,i);
        end
    end
    if iterations == 100
        doesConverge = false;
    else
        doesConverge = true;
    end
        error = sqrt((x0 - Z).^2);
        x = x0;
end