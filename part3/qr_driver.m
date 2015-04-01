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
    prompt = 'Which method would like to use? Enter g for Givens or h for Householder.\n';
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
        [Q,R,err,xsol] = solve_qr_b(inputMatrix,method);
        
        fprintf('Q:\n');
        disp(Q);
        fprintf('\nR:\n');
        disp(R);
        fprintf('Xsol transposed: \n');
        disp(xsol');
        fprintf('Error: %d\n',err);
        
    elseif inputCol == inputRows
        A = inputMatrix;
        if method == 'g'
            [Q,R,err] = qr_fact_givens(A);
        elseif method == 'h'
            [Q,R,err] = qr_fact_househ(A);
        end
        fprintf('\nQ:\n');
        disp(Q);
        fprintf('\nR:\n');
        disp(R);
        fprintf('Error: %d\n',err);
    else
        
end