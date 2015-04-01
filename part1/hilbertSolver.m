function hilbertSolver(n)

    fid = fopen('hilbertResults.txt','wt');
    for i = [2:n]
        [H,b] = hilbertMaker(i);
        input = horzcat(H,b);
        
        [~,~,LUerr,LUxsol,solErrLU] = solve_lu_b(input);
        [~,~,houseErr,houseXSol,solErrHouse] = solve_qr_b(input,'h');
        [~,~,givensErr,givensXSol,solErrGivens] = solve_qr_b(input,'g');
        fprintf(fid,'%d Results\n\n',i);
        fprintf(fid,'Xsol: ');
        fprintf(fid,'%f ',LUxsol);
        fprintf(fid,'\n\n');
        fprintf(fid,'LU Results:\nError: %d\n',LUerr);
        fprintf(fid,'Solution Error: %d\n',solErrLU);
        fprintf(fid,'\n');
        fprintf(fid,'Householder Results:\nError: %d\n',houseErr);
        fprintf(fid,'Solution Error: %d\n',solErrHouse);
        fprintf(fid,'\n');
        fprintf(fid,'Givens Results:\nError: %d\n',givensErr);
        fprintf(fid,'Solution Error: %d\n',solErrGivens);
        fprintf(fid,'\n\n\n');
        
    end
    fclose(fid);

end