function [xsol] = forwardSubSolve(A,b)

    m = length(b);
    xsol = zeros(m,1);
    
    xsol(1) = b(1)/A(1,1);
    for i = [2:m]
        add = 0;
        for k = [i-1:-1:1]
            add = add + A(i,k)*xsol(k);
        end
            
        xsol(i) = (b(i) - add)/A(i,i);
    end


end