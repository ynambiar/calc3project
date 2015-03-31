function hilbertSolver(n)

    fid = fopen('hilbertResults.txt','wt');
    for i = [2:n]
        [H,b] = hilbertMaker(i);
        input = horzcat(H,b);
        
        [~,~,LUerr,LUxsol] = solve_lu_b(input);
        [~,~,houseErr,houseXSol] = solve_qr_b(input,'h');
        [~,~,givensErr,givensXSol] = solve_qr_b(input,'g');
        solErr = maxNorm(multMatrix(H,givensXSol)-b);
        fprintf(fid,'%d Results\n\n',i);
        fprintf(fid,'Xsol: ');
        fprintf(fid,'%f ',LUxsol);
        fprintf(fid,'\n\n');
        fprintf(fid,'LU Results:\nError: %d\n',LUerr);
        fprintf(fid,'\n');
        fprintf(fid,'Householder Results:\nError: %d\n',houseErr);
        fprintf(fid,'\n');
        fprintf(fid,'Givens Results:\nError: %d\n',givensErr);
        fprintf(fid,'\n');
        fprintf(fid,'Solution Error: %d',solErr);
        fprintf(fid,'\n\n\n');
        
    end
    fclose(fid);

end