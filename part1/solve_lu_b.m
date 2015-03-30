function [b] = solve_lu_b(filename)

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
    
    [inputRows, inputCol] = size(inputMatrix);
    if inputCol - 1 == inputRows
        A = inputMatrix(:,1:inputCol-1)
        B = inputMatrix(:,inputCol)
        [L,U,err] = lu_fact(A);
        
    elseif inputCol == inputRows
        A = inputMatrix;
        [L,U,err] = lu_fact(A)
        
    else
        
    end
    

end