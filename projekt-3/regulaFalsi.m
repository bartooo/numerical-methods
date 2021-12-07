function [c] = regulaFalsi(a0, b0, delta, n_max, f)
%REGULAFALSI Znajdywanie miejsc zerowych funkcji
% za pomocą metody regula falsi (false position)

a = a0;
b = b0;

if f(a) * f(b) > 0
    error('Brak obszaru izolacji');
end

n = 1;
err = inf;

while n <= n_max && err > delta
    c = (a*f(b) - b*f(a)) / (f(b) - f(a));

    if f(a)*f(c) < 0
        b = c;
    else
        a = c;
    end

    err = abs(f(c));
    n = n + 1;
end
end