function [Q,R,err] = qr_fact_househ(A)

    [~,numCol] = size(A);
    R = A;
    Q = [];
    for i = [1:numCol-1]
        x = R(i:end, i);
        alph = magnitude(x);
        e = eye(length(x),1);
        u = x - alph * e;
        v = u / magnitude(u);
        newQ = eye(length(x)) - 2 * multMatrix(v,v');
        multR = eye(numCol);
        dif = numCol - length(newQ);
        for r = [1:length(newQ)]
            for c = [1:length(newQ)]
                multR(r + dif, c + dif) = newQ(r,c);
            end
        end
        R = multMatrix(multR,R);
        if 0 == size(Q)
            Q = newQ';
        else
            Q = multMatrix(Q,multR');
        end
    end

    multMatrix(Q,R)-A;
    err = maxNorm(multMatrix(Q,R)-A);

end