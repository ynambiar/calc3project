function [iterations, x, doesConverge] = jacobi(A,y,x0,tol)
    
    %calcualte first iterations
    n = length(y);
    for j = 1:1:n
         x(j) = ((y(j) - A(j,[1:j-1,j+1:n]) * x0([1:j-1,j+1:n])) / A(j,j)); % the first iteration
    end
    
    %initialize variables
    error = ones(n,1);
    x1 = x;
    doesConverge = 0;
    iterations = 0;
    
    %iterative loop, checks agains tolerance and iterations
    while max(error) > tol && iterations < 100
        iterations = iterations + 1;
        for j = 1:1:n
            z(j) = ((y(j) - A(j,[1:j-1,j+1:n]) * x1([1:j-1,j+1:n])) / A(j,j));
        end
        x0 = x1;
        x1 = z';
        
        if size(x0) ~= size(x1)
            disp('hey')
            x0 = x0';
        end
        error = sqrt((x1 - x0).^2);
    end
    
    %checks if method converges within fixed number of iterations
    if iterations == 100
        doesConverge = -1;
    else
        doesConverge = 1;
    end
    
    %set new x
    x = x1';
    
end