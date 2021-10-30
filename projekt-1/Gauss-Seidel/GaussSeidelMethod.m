function [x] = GaussSeidelMethod(A, b, n, e2)
%GAUSSSEIDELMETHOD Funkcja rozwiązująca układy równań metodą iteracyjną
%Gaussa-Seidela
L = zeros(n, n); % macierz poddiagonalna
D = zeros(n, n); % macierz diagonalna
U = zeros(n, n); % macierz naddiagonalna
x_new = zeros(n, 1);

% Sprawdzenie czy macierz A jest silnie diagonalnie dominująca, by
% określić czy metoda jest zbieżna
for i = 1:n
    if abs(A(i,i)) <= (sum(abs(A(i,:))) - abs(A(i,i)))
        disp('Macierz A nie jest silnie diagonalnie dominująca');
        return
    end

    if abs(A(i,i)) <= (sum(abs(A(:,i))) - abs(A(i,i)))
        disp('Macierz A nie jest silnie diagonalnie dominująca');
        return
    end
end

% Dekompozycja macierzy A
for i = 1:n
    for j = 1:n
        if i == j
            D(i, j) = A(i, j);
        elseif i < j
            U(i, j) = A(i, j);
        else
            L(i, j) = A(i, j);
        end
    end
end

error = 1.0;
% Iterowanie jest przerywane, gdy norma euklidesowa różnicy między
% kolejnymi przybliżeniami rozwiązania jest nie większa niż błąd graniczny
while error > e2
    x_curr = x_new;
    % Kolejno wyznaczam składowe nowego wektora
    w = U*x_curr - b;
    for i = 1:n
        x_new(i) = (-L(i,:)*x_new - w(i)) / D(i, i);
    end

    error = norm(x_new - x_curr);
end

x = x_new;
end
