function [errors] = BtestGaussSeidel(n, e2)
%ATESTGAUSSSEIDEL Funkcja testująca działanie metody Gaussa-Seidela na
%układach równań wygenerowanych zgodnie z pkt. B

errors = zeros(size(n));
i = 1;
for n_i = n
    [A, b] = genEquationsB(n_i);
    tic
    x = GaussSeidelMethod(A, b, n_i, e2);
    toc
    errors(i) = euclideanNorm(A*x - b);
    i = i + 1;
end

plot(n, errors);
title('Zależność błędu rozwiązania od liczby równań n - punkt B')
xlabel('Liczba równań (n)');
ylabel('Błąd');
end