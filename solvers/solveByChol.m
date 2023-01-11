function [X] = solveByDiagChol(A, B, m)
% Funckja przyjmuje macierz A, która jest macierzą symetryczną dodatnio 
% określoną m-diagonalną oraz macierz B i używając rozkładu 
% Cholesky'ego-Bancheiwicza zwraca rozwiązanie równania macierzowego
% XA = B.

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

L = cholDecompDiag(A, m);
Y = solveUpperDiag(L', B, m);
X = solveLowerDiag(L, Y, m);

end

