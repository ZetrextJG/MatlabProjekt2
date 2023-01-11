sizes = [5 10 20 40 80 160 500 1000 2000 3000 4000 8000]; % Wilkości macierzy

times = zeros(12, 3);
errors = zeros(12, 2);
for i=1:12
    s = sizes(1, i);
%     R = randKdiag(s, 5);
    R = randKdiagC(s, 5);
    
    matlabChol = chol(R,"lower");
    myChol = cholDecompDiag(R, 5);
    myCholWeak = cholDecomp(R);

    errors(i,1) = norm(matlabChol - myChol) / norm(matlabChol);
    errors(i,2) = norm(matlabChol - myCholWeak) / norm(matlabChol);

    times(i, 1) = timeit(@() chol(R, "lower"));
    times(i, 2) = timeit(@() cholDecompDiag(R, 5));
    if s <= 2000
        times(i, 3) = timeit(@() cholDecomp(R));
    end

    disp(strcat("Done part ", string(i)));
end
