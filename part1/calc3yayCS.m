
%function [out1, out2] = functionName (in1, in2)

if x > 10
    y = 10;
elseif z == 10
    y = 9;
else
    y = 0;
end

vec = [10 9 27 5 2]
matrix = [1 2 3; 4 5 6]
third = vec(3)
lasttwo = vec(end-2:end)
evenindicies = vec(2:2:end)
allofrow1 = matrix(1,:)
allofcol2 = matrix(:, 2)

bigvec = [vec1 vec2]
horzcat
vertcat

vec(3) = 30;

vec = [];
for i = [1:2:10]
    addme = vec2(i)
    vec = [vec addme]
end

zeromatrix = zeros(3,4)
onesmatrix = ones(4,5)

%extract matrix from .txt or .dat
fh = fopen(filename, 'r');
line = fgets(fh);
matrix = [];
while ischar(line)
    row = [];
    rest = line;
    for i = 1:length(line)
        [number, rest] = strtok(rest);
        number = str2num(number);
        row = [row number];
    end
    matrix = vertcat(matrix, row);
end
fclose(fh);



end