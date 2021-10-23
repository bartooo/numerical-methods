function [] = BtestGaussSeidel(n)
%ATESTGAUSSSEIDEL Funkcja testująca działanie metody Gaussa-Seidela na
%układach równań wygenerowanych zgodnie z pkt. B

errors = zeros(size(n));
i = 1;
for n_i = n
    [A, b] = genEquationsB(n_i);
    x = GaussSeidelMethod(A, b, n_i, 0.001);
    errors(i) = euclideanNorm(A*x - b);
    i = i + 1;
end

plot(n, errors);
title('Zależność błędu rozwiązania od liczby równań n')
xlabel('Liczba równań (n)');
ylabel('Błąd');
end