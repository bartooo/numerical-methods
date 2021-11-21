function [euclidean_errors, chebyshev_errors] = approxNormalEquations(n, x, y)
%APPROXNORMALEQUATIONS Aproksymacja metodą najmniejszych kwadratów z
%wykorzystaniem układu równań normalnych
A = zeros(size(x,1), max(n)+1);
euclidean_errors = zeros(size(n,1),1);
chebyshev_errors = zeros(size(n,1),1);

% Konstruuję macierz A, której kolumny to elementy wektora x podnoszone do
% kolejnych potęg
for i = 1:size(x,1)
    for k = 1:max(n)+1
        A(i,k) = x(i)^(k-1);
    end
end

if size(n,1) > 1
    subplot(2,1,1);
end

lin = linspace(min(x), max(x), 100)';
scatter(x,y, "DisplayName","dane");
legend('Location', 'southeast');
title("Aproksymacja przy pomocy układu równań normalnych");
hold on;

for i = 1:size(n,1)
    A_i = A(:,1:n(i)+1);

    % Rozwiązuje równanie normalne przy pomocy rozkładu LU
    a_i = LUDecomposition(A_i'*A_i, A_i'*y, n(i)+1);

    % Liczę błąd aproksymacji w normie euklidesowej
    euclidean_errors(i) = norm(polynomialValue(a_i, x)-y);

    % Liczę błąd aproksymacji w normie Czebyszewa
    chebyshev_errors(i) = norm(polynomialValue(a_i, x)-y, "inf");

    plot(lin, polynomialValue(a_i, lin),'DisplayName', "stopień " + n(i));
end
hold off;

if size(n,1) > 1
    subplot(2,1,2);
    plot(x, euclidean_errors, "DisplayName","Błąd w normie euklidesowej");
    title("Błędy");
    legend('Location', 'southeast');
    hold on;
    plot(x, chebyshev_errors, "DisplayName","Błąd w normie Czebyszewa");
    hold off;
end
end