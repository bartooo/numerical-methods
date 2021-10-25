function [errors] = AtestLU(n)
%ATESTLU Funkcja testująca działanie metody rozkładu LU na układach równań
%wygenerowanych zgodnie z pkt. A

errors = zeros(size(n));
i = 1;
for n_i = n
    [A, b] = genEquationsA(n_i);
    tic
    x = LUDecomposition(A, b, n_i);
    toc
    errors(i) = euclideanNorm(A*x - b);
    i = i + 1;
end

plot(n, errors);
title('Zależność błędu rozwiązania od liczby równań n - punkt A')
xlabel('Liczba równań (n)');
ylabel('Błąd');
end