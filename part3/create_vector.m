function[vec] = create_vector(mat)
[rows, col] = size(mat)   
vec = []
for i = 1:size(rows)
    vec = [vec; 1]
end
end