function [X] = solveUpperDiag(U, B, m)
% Funkcja rozwiązująca układ rówań macierzowych XU = B,
% gdzie macierz U jest macierzą górno-trójkątną (odwracalną)
% powstała z rozkłądu macierzy m-diagonalnej.
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

% Liczba niezerowych elementow w dół pierwszej kolumnie od diagonali.
m_k = idivide(m, int32(2)); 

X(1:k, 1) = B(1:k, 1) ./ U(1,1);
for i = 2:n % Index kolumny, którą obliczamy
    slWinY = max(1, (i-1-m_k));
    rest = X(1:k, slWinY:(i-1)) * U(slWinY:(i-1), i);
    X(1:k, i) = (B(1:k, i) - rest) ./ U(i,i);
end