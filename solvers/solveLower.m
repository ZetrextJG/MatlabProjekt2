function [X] = solveLower(L, B)
% Funkcja rozwiązująca układ rówań macierzowych XL = B,
% gdzie macierz L jest macierzą dolno-trójkątną (odwracalną).
% Argument B może być albo macierzą, bądz wektorem poziomym

if ~ismatrix(L)
    error("Argument L nie podany, bądz nie jest macierzą");
end

if ~ismatrix(B)
    error("Argument B nie podany, bądz nie jest macierzą");
end

if ~istril(L)
    error("Macierz L nie jest macierzą dolno-trójkątna");
end


[nRowsB, nColsB] = size(B);
[nRowsL, nColsL] = size(L);

if nColsB ~= nColsL
    error("Macierze nie są odpowiednych wymiarów")
end

% Dla ułatwienie notacji
n = nRowsL; % Liczba wierszy
k = nRowsB; % Liczba kolumn
X = zeros(k, n);

X(1:k, n) = B(1:k, n) ./ L(n,n);
for i = (n-1):-1:1
    rest = X(1:k, (i+1):n) * L((i+1):n, i);
    X(1:k, i) = (B(1:k, i) - rest) ./ L(i,i);
end



