function [Q,R,err,xsol] = solve_qr_b(inputMatrix,method)

    [~,inputCol] = size(inputMatrix);
    A = inputMatrix(:,1:inputCol-1);
    b = inputMatrix(:,inputCol);
    
    if method == 'g'
        [Q,R,err] = qr_fact_givens(A);
        y = multMatrix(Q',b);
        xsol = backSubSolve(R,y);
    elseif method == 'h'
        [Q,R,err] = qr_fact_househ(A);
        y = multMatrix(Q',b);
        xsol = backSubSolve(R,y);
        
    end

end