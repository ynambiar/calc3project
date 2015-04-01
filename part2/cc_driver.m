function cc_driver()
 
    %Prompt for solving method
    prompt = 'Would you like to encode or decode? Enter e to encode or d to decode. ';
    keepPrompt = true;
    while keepPrompt
        method = input(prompt,'s');
        if method == 'e' | method == 'd'
            keepPrompt = false;
        end
    end
    
    %Solve and output
    if method == 'e'
        prompt = 'Enter size of vector you want to encode. ';
        keepPrompt = true;
        while keepPrompt
            n = input(prompt,'s');
            if n > 0
                keepPrompt = false;
            end
        end
        [y] = encoding(n);
        disp('Encoded random binary sequence of length n:')
        disp(y)
    elseif method == 'd'
        prompt = 'Enter the vector you want to decode without brackets. ';
        keepPrompt = true;
        while keepPrompt
            y = input(prompt,'s');
            if length(y) > 0
                keepPrompt = false;
            end
        end
        [x] = decoding(y);
        disp('Decoded binary sequence:')
        disp(x);
    end
        
    
end