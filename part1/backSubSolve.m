function [xsol] = backSubSolve(A,b)

    m = length(b);
    xsol = zeros(m,1);
    
    xsol(m) = b(m)/A(m,m);
    for i = [m-1:-1:1]
        add = 0;
        for k = [i+1:m]
            add = add + A(i,k)*xsol(k);
        end
            
        xsol(i) = (b(i) - add)/A(i,i);
    end

end