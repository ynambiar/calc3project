function[lambda, numIters] = power_method(filename1, filename2)
A = read_file(filename1)
u = read_file(filename2)
tol = 1/10000000;
numIters = 1;
error = 1;
lambda = 10;
while error > tol && numIters <= 1000
    uNext = multiply_mat_vec(A, u');
    lambda = largestValue(uNext);
    uNext = uNext ./ lambda
    error = minus(uNext, u);
    error = sqrt(sum(error .^ 2));
    u = uNext;
    numIters = numIters + 1;
end
if numIters > 1000
    fprintf('Eigenvalues did not converge in 1000 iterations') 
end
end


