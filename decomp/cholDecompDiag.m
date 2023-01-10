function [L] = cholDecompDiag(A, m)
% Funckja obliczająca rozkład Cholesky'ego-Banachewicza macierzy m-diagonalej (A).
% Macierz A musi być macierzą kwadratową pozytywnie półokreśloną
% w przypadku podania macierzy o innej specyfikacji otrzymamy błąd
% Funkcja zwraca macierz L dolno-trójkątna o tym samych wymiarach co A
% spełniającą równanie A = LL*. (rozkład Cholesky'ego)

% if ~ismatrix(A)
%     error("Nie podano arugmentu A, bądz argument nie jest macierzą")
% end
% 
% if ~issymmetric(A)
%     error("Macierz A nie jest symetryczna")
% end
% 
% % Sprawdzamy czy macierz A jest dodatnio półokreślona z pewną niepewnościa
% eigenVals = eig(A); 
% tol = length(eigenVals) * eps(max(eigenVals)); 
% if ~all(eigenVals > -tol)
%     error("Macierz A nie jest pozytywnie półokreślona")
% end

n = length(A);
L = zeros(n);

% Liczba niezerowych elementow w dół pierwszej kolumnie od diagonali.
m_k = idivide(m, int32(2)); 

% Specjalny przypadek pierwszej kolumny
L(1,1) = sqrt(A(1,1));
L(2:(m_k+1), 1) = A(2:(m_k+1), 1) ./ L(1,1);

% Pozostałe kolumny
for k = 2:n
    % Tworzymy wektor indeksów niezerowych elementów dla wierza
    slWinX = max(1, k-m_k):(k-1);
    
    r = L(k, slWinX);

    % Diagonalny element
    L(k, k) = sqrt(A(k,k) - r * (r'));

    % Tworzymy wektor indeksów niezerowych elementów dla kolumny
    slWinY = (k+1):min(k+m_k, n);

    % Reszta kolumny
    sektor = L( slWinY, slWinX );
    L( slWinY, k ) = (A( slWinY, k ) - sektor * (r')) / L(k,k);
end
