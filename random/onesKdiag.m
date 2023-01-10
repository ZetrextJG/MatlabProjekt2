function [Z] = onesKdiag(n, m)
% Funkcja tworzy macierz m-diagonalna wypełnioną jedynkami.
% wymiarach nxn z elementami w liczbach rzeczywistych.

k = idivide(m, int32(2)) + 1;
if n < k
    error("Nie można utworzyć macierzy m-diagonalej o takich wymiarach");
end

M = ones(n);
Z = zeros(n);

for i = (-k + 1):(k - 1)
    Z = Z + diag(diag(M, i), i);
end

end
