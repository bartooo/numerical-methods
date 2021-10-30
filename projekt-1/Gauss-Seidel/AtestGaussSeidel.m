function [errors] = AtestGaussSeidel(n, e2)
%ATESTGAUSSSEIDEL Funkcja testująca działanie metody Gaussa-Seidela na
%układach równań wygenerowanych zgodnie z pkt. A

errors = zeros(size(n));
i = 1;
for n_i = n
    [A, b] = genEquationsA(n_i);
    tic
    x = GaussSeidelMethod(A, b, n_i, e2);
    toc
    errors(i) = norm(A*x - b);
    i = i + 1;
end

plot(n, errors);
title('Zależność błędu rozwiązania od liczby równań n - punkt A')
xlabel('Liczba równań (n)');
ylabel('Błąd');
end