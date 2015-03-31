function iterative_driver(filenameA, filenamey)
    %Reads File
    fh = fopen(filenameA, 'r');
    line = fgets(fh);
    A = [];
    while ischar(line)
        row = [];
        rest = line;
        for i = 1:length(line)
            [number, rest] = strtok(rest);
            number = str2num(number);
            row = [row number];
        end
        A = vertcat(A, row);
        line = fgets(fh);
    end
    fclose(fh);
    
    fh = fopen(filenamey, 'r');
    line = fgets(fh);
    y = [];
    while ischar(line)
        row = [];
        rest = line;
        for i = 1:length(line)
            [number, rest] = strtok(rest);
            number = str2num(number);
            row = [row number];
        end
        y = vertcat(y, row);
        line = fgets(fh);
    end
    fclose(fh);
 
    %Prompt for solving method
    prompt = 'Which iterative method would you like to use? Enter j for Jacobi and g for Gauss-Seidel.';
    keepPrompt = true;
    while keepPrompt
        method = input(prompt,'s');
        if method == 'j' | method == 'g'
            keepPrompt = false;
        end
    end
    
    %Solve and output
    disp('A = ');
    disp(A);
    disp('y = ');
    disp(y);

    x0 = zeros(length(y),1);
    tol = 0.00000001;
    if method == 'j'
        [iterations, x, doesConverge] = jacobi(A,y,x0,tol); 
        if doesConverge
            disp('The number of iterations to find the solution x, ')
            disp(x);
            disp('is');
            disp(iterations);
        else
            disp('Sorry! x cannot be found. The method does not converge after 100 iterations.');
        end
    end
    if method =='g'
        [iterations, x, doesConverge] = gauss_seidel(A,y,x0,tol);
        if doesConverge
            disp('The number of iterations to find the solution x, ')
            disp(x);
            disp('is');
            disp(iterations);
        else
            disp('Sorry! x cannot be found. The method does not converge after 100 iterations.');
        end
    end
        
    
end