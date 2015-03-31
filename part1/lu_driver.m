function lu_driver(filename)
    %Reads File
    fh = fopen(filename, 'r');
    line = fgets(fh);
    inputMatrix = [];
    while ischar(line)
        row = [];
        rest = line;
        for i = 1:length(line)
            [number, rest] = strtok(rest);
            number = str2num(number);
            row = [row number];
        end
        inputMatrix = vertcat(inputMatrix, row);
        line = fgets(fh);
    end
    fclose(fh);
    
    %Solves and gives output
    [inputRows, inputCol] = size(inputMatrix);
    if inputCol - 1 == inputRows
        [L,U,err,xsol] = solve_lu_b(inputMatrix);
        
        fprintf('L:\n');
        disp(L);
        fprintf('\nU:\n');
        disp(U);
        fprintf('Xsol transposed: \n');
        disp(xsol');
        fprintf('Error: %d\n',err);
    elseif inputCol == inputRows
        A = inputMatrix;
        [L,U,err] = lu_fact(A);
        
        fprintf('L:\n');
        disp(L);
        fprintf('\nU:\n');
        disp(U);
        fprintf('Error: %d\n',err);
        
    else
        
end