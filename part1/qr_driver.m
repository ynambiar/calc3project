function qr_driver(filename)
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
    
    %Prompt for solving method
    prompt = 'Which method would like to use? Enter g for Givens or h for Householder.';
    keepPrompt = true;
    while keepPrompt
        method = input(prompt,'s');
        if method == 'g' | method == 'h'
            keepPrompt = false;
        end
    end
    
    %Solve and output
    [inputRows, inputCol] = size(inputMatrix);
    if inputCol - 1 == inputRows
        [Q,R,err,xsol] = solve_qr_b(inputMatrix,method)
        
        sprintf('Q:\n');
        disp(Q);
        sprintf('\nR:\n');
        disp(R);
        sprintf('Error: %d',err);
        sprintf('Xsol transposed: %s',sprintf('%d ',xsol));
    elseif inputCol == inputRows
        A = inputMatrix;
        if method == 'g'
            [Q,R,err] = qr_fact_givens(A);
        else method == 'h'
            [Q,R,err] = qr_fact_househ(A);
        end
        sprintf('Q:\n');
        disp(Q);
        sprintf('\nR:\n');
        disp(R);
        sprintf('Error: %d',err);
    else
        
end