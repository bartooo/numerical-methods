function [errors] = BtestLU(n)
%BTESTLU Funkcja testująca działanie metody rozkładu LU na układach równań
%wygenerowanych zgodnie z pkt. B

errors = zeros(size(n));
i = 1;
for n_i = n
    [A, b] = genEquationsB(n_i);
    tic
    x = LUDecomposition(A, b, n_i);
    toc
    errors(i) = euclideanNorm(A*x - b);
    i = i + 1;
end

plot(n, errors);
title('Zależność błędu rozwiązania od liczby równań n - punkt B')
xlabel('Liczba równań (n)');
ylabel('Błąd');
end