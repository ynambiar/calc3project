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
        [L,U,err] = solve_lu_b(inputMatrix);
        
        sprintf('L:\n');
        disp(L);
        sprintf('\nU:\n');
        disp(U);
        sprintf('Error: %d',err);
        sprintf('Xsol transposed: %s',sprintf('%d ',xsol));
    elseif inputCol == inputRows
        A = inputMatrix;
        [L,U,err] = lu_fact(A)
        
        sprintf('L:\n');
        disp(L);
        sprintf('\nU:\n');
        disp(U);
        sprintf('Error: %d',err);
        
    else
        
end