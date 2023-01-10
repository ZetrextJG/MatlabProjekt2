function [Z] = randKdiagC(n, m)
% Funkcja tworzy losową dodatnio określoną macierz m-diagonalną o
% wymiarach nxn z elementami w liczbach zespolonych.

k = idivide(m, int32(2)) + 1;
if n < k
    error("Nie można utworzyć macierzy m-diagonalej o takich wymiarach");
end

M = complex(rand(n, n), rand(n,n));
% Upewniany się, że macierz będzie macierzą spanującą całą przestrzeń. 
while det(M) == 0
    M = complex(rand(n, n), rand(n,n));
end

A = M*(M') + n*eye(n);
Z = zeros(n);

Z = Z + diag(diag(A, 0), 0);
for i = (-k+1):-1
    Z = Z + diag(diag(A, i), i);
end
for i = 1:(k-1)
    Z = Z + diag(diag(A, i)', i);
end
end
