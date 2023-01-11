sizes = [5 10 20 40 80 160 500 1000 2000 3000 4000 8000]; % Wilkości macierzy

times = zeros(12, 2);
errors = zeros(12, 1);
for i=1:11
    s = sizes(1, i);
%     R = randKdiag(s, 5);
    R = randKdiagC(s, 5);
    
    matlabInv = inv(R);
    myInv = solveByChol(R, eye(s), 5);

    errors(i,1) = norm(matlabInv - myInv) / norm(matlabInv);

    times(i, 1) = timeit(@() inv(randKdiagC(s, 5))) - timeit(@() randKdiagC(s, 5));
    times(i, 2) = timeit(@() solveByChol(randKdiagC(s, 5), eye(s), 5)) - timeit(@() randKdiagC(s, 5)) - timeit(@() eye(s));

    disp(strcat("Done part ", string(i)));
end
