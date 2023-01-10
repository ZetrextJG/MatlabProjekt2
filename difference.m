r = randKdiag(3000, 5);

% c1 = chol(r).';
% c2 = cholDecomp(r);
L = cholDecompDiag(r, 5);

% sum(c1 - c3, [1 2])
% timeit(@() chol(r))
% timeit(@() cholDecomp(r))
% timeit(@() cholDecompDiag(r, 5))
mult = @(x) (x')*x; 
e = eye(3000);

timeit(@() inv(r))
timeit(@() mult(solveLowerDiag(L, e, 5)))