N = [1:50];
P = [1:100];

results = zeros(10, 10, "int8");

for n=N
    A = randKdiagC(10*n, 5);
    for p=P
        X = rand(10*p, 10*n);
        B = X * A;
        
        times = zeros(1, 3);
        times(1, 1) = timeit(@() (linsolve(A.', B.')).');
        times(1, 2) = timeit(@() (B / A));
        times(1, 3) = timeit(@() (solveByChol(A, B, 5)));
        [M, i] = max(times);
        results(n, p) = int8(i);
    end
    disp(strcat("Done part ", string(n)));
end
