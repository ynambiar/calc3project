function [L,U,err,xsol,xsolerr] = solve_lu_b(inputMatrix)

    [~,inputCol] = size(inputMatrix);
    A = inputMatrix(:,1:inputCol-1);
    b = inputMatrix(:,inputCol);
    
    [L,U,err] = lu_fact(A);
    
    y = forwardSubSolve(L,b);
    xsol = backSubSolve(U,y);
    
    xsolerr = maxNorm(multMatrix(A,XSol)-b);

end