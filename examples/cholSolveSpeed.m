sizes = [5 10 20 40 80 160 500 1000 2000 3000 4000 8000]; % Wilkości macierzy

times = zeros(12, 4);
errors = zeros(12, 4);
for i=1:12
    s = sizes(1, i);
    A = randKdiag(s, 5);
    % A = randKdiagC(s, 5);
    X_real = rand(1, s);

    B = X_real * A;

    linsolveSol = (linsolve(A.', B.')).';
    inverseSol = B / A;
    basicInverseSol = B * inv(A);
    cholSol = solveByChol(A, B, 5);

    errors(i,1) = norm(linsolveSol - X_real) / norm(X_real);
    errors(i,2) = norm(inverseSol - X_real) / norm(X_real);
    errors(i,3) = norm(basicInverseSol - X_real) / norm(X_real);
    errors(i,4) = norm(cholSol - X_real) / norm(X_real);

    times(i, 1) = timeit(@() (linsolve(A.', rand(1, s).')).') - timeit(@() rand(1, s));
    times(i, 2) = timeit(@() (rand(1,s) / A)) - timeit(@() rand(1, s));
    times(i, 3) = timeit(@() (rand(1,s) * inv(A))) - timeit(@() rand(1, s));
    times(i, 4) = timeit(@() (solveByChol(A, rand(1,s), 5))) - timeit(@() rand(1, s));

    disp(strcat("Done part ", string(i)));
end