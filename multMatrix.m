function [newM] = multMatrix(A,B)

    [newMRow, ~] = size(A);
    [~, newMCol] = size(B);
    
    newM = zeros(newMRow, newMCol);
    for i = [1:newMRow]
        for j = [1:newMCol]
            aVec = A(i,:);
            bVec = B(:,j);
            newM(i,j) = dot(aVec, bVec);
        end
    end

end