function [L,U,err] = lu_fact(A)

    [numRows,numCol] = size(A);
    j = 1;
    i = 2;
    L = eye(size(A));
    U = A;
    while j < numCol
        i = j+1;
        while i > j & i <= numRows
            L(i,j) = U(i,j)/U(j,j);
            U(i,:) = U(i,:) - L(i,j) * U(j,:);
            i = i+1;
        end
        j = j+1;
    end
    
    err = maxNorm(multMatrix(L,U)-A);

end