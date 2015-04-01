function [iterations, x, doesConverge] = gauss_seidel(A,y,x0,tol)
    
    %initialize variables
    n = length(y);
    error = ones(n,1);
    doesConverge = 0;
    iterations = 0;
    
    %iterative loop, checks agains tolerance and iterations
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
        error = sqrt((x0 - Z).^2);
    end
    
    %checks if method converges within fixed number of iterations
    if iterations == 100
        doesConverge = -1;
    else
        doesConverge = 1;
    end
    
    %set new x
    x = x0;
    
end