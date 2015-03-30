function [b] = solve_lu_b(filename)

    fh = fopen(filename, 'r')
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
        inputMatrix = vertcat(inputMatrix, row)
        line = fgets(fh)
    end
    fclose(fh);
    
    b = inputMatrix
    [ans1,ans2] = lu_fact(b)

end