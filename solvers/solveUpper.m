function [X] = solveUpper(U, B)
% Funkcja rozwiązująca układ rówań macierzowych XU = B,
% gdzie macierz U jest macierzą górno-trójkątną (odwracalną).
% Argument B może być albo macierzą, bądz wektorem poziomym

if ~ismatrix(U)
    error("Argument U nie podany, bądz nie jest macierzą");
end

if ~ismatrix(B)
    error("Argument B nie podany, bądz nie jest macierzą");
end

if ~istriu(U)
    error("Macierz U nie jest macierzą górno-trójkątna");
end

[nRowsB, nColsB] = size(B);
[nRowsU, nColsU] = size(U);

if nColsB ~= nColsU
    error("Macierze nie są odpowiednych wymiarów")
end

% Dla ułatwienie notacji
n = nRowsU; % Liczba wierszy
k = nRowsB; % Liczba kolumn
X = zeros(k, n);

X(1:k, 1) = B(1:k, 1) ./ U(1,1);
for i = 2:n % Index kolumny, którą obliczamy
    rest = X(1:k, 1:(i-1)) * U(1:(i-1), i);
    X(1:k, i) = (B(1:k, i) - rest) ./ U(i,i);
end

