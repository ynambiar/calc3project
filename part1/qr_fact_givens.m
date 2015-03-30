function [Q,R,err] = qr_fact_givens(A)
    [numRows,numCol] = size(A);
    i = 2;
    j = 1;
    R = A;
    Q = [];
    while j < numCol
        i = j+1;
        while i > j & i <= numRows
            r = sqrt(R(j,j)^2 + R(i,j)^2);
            c = R(j,j)/r;
            s = -R(i,j)/r;
            G = eye(numCol);
            G(i,i) = c;
            G(j,j) = c;
            G(i,j) = s;
            G(j,i) = -s
            
            R = multMatrix(G,R)
            if 0 == size(Q)
                Q = G';
            else
                Q = multMatrix(Q,G');
            end
            i = i+1;
        end
        j = j+1;
    end
    
    err = maxNorm(multMatrix(Q,R)-A);

end