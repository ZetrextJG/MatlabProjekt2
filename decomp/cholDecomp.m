function [L] = cholDecomp(A)
% Funckja obliczająca rozkład Cholesky'ego-Banachewicza macierzy (A).
% Macierz A musi być macierzą kwadratową pozytywnie półokreśloną
% w przypadku podania macierzy o innej specyfikacji otrzymamy błąd
% Funkcja zwraca macierz L dolno-trójkątna o tym samych wymiarach jak A
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

% Specjalny przypadek pierwszej kolumny
L(1,1) = sqrt(A(1,1));
L(2:n, 1) = A(2:n, 1) ./ L(1,1);

% Pozostałe kolumny
for k = 2:n
    r = L(k, 1:(k-1)); % Wektor poziomy
    L(k, k) = sqrt(A(k,k) - r * (r'));
    sektor = L( (k+1):n, 1:(k-1) );
    L( (k+1):n, k ) = (A( (k+1):n, k ) - sektor * (r')) / L(k,k);
end

