function [x0_value, alphas, alphas_values, ns] = findRootsMM2(x0, delta, n_max)
% Początkowe wartości współczynników wielomianu
a = [-1 1.5 1.5 0.5 1]';

alphas = zeros(size(a,1)-1,1);
alphas_values = zeros(size(a,1)-1,1);
ns = zeros(size(a,1)-1,1);
x0_value = polynomialValue(a, x0);

figure(1);
lin = linspace(-3, 3)';

% Wykres punktu początkowego
scatter(x0, polynomialValue(a, x0), "DisplayName","Punkt początkowy", "LineWidth",1.5);

title('Znalezione miejsce zerowe wielomianu za pomocą metody MM2');

hold on;
grid on;

% W każdej iteracji upraszczamy wielomian do wielomianu niższego rzędu
for i = 1:size(a,1)-1
    % Znalezienie pierwiastka wielomianu
    f = a;
    % Wyznaczenie współczynników pochodnych
    df = polynomialDerivative(f);
    ddf = polynomialDerivative(df);

    % Znalezienie pierwiastka
    [alphas(i), ns(i)] = MM2(x0, delta, n_max, f, df, ddf);
    alphas_values(i) = polynomialValue(f, alphas(i));

    % Wykres wielomianu i znalezionego miejsca zerowego w danej iteracji
    plot(lin, polynomialValue(f, lin), "DisplayName", "Wielomian rzędu " + (size(a,1) - 1));
    scatter(alphas(i), polynomialValue(f, alphas(i)), "DisplayName", "Znalezione miejsce zerowe dla wielomianu rzędu " + (size(a,1) - 1));
    % Deflacja czynnikiem liniowym
    a = deflationHorner(a, alphas(i));
end
line(xlim(), [0,0], 'LineWidth', 0.5, 'Color', 'k');
legend("Location","best");
hold off;
end