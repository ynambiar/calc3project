function[inputMatrix, inputVector] = driver(filename)
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
        line = fgets(fh)
    end
    fclose(fh);
end