function [A] = randKdiagOLD(n, m)
% Funkcja tworzy losową dodatnio określoną macierz m-diagonalną o
% wymiarach nxn z elementami w liczbach rzeczywistych.

k = idivide(m, int32(2)) + 1;
if n < k
    error("Nie można utworzyć macierzy m-diagonalej o takich wymiarach");
end

M = rand(n);
% Upewniany się, że macierz będzie macierzą spanującą całą przestrzeń. 
while det(M) == 0
    M = rand(n);
end

Z = zeros(n);

for i = 0:(k - 1)
    Z = Z + diag(diag(M, i), i);
end

A = Z * (Z.') + eye(n);
end


