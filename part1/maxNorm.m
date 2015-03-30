function [maxNorm] = maxNorm(A)
    absA = abs(A(:));
    maxNorm = max(absA);
end