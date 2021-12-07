function [x_next] = newtonMethod(x0, delta, n_max, f, df)
%NEWTONMETHOD Znajdywanie miejsc zerowych funkcji
% za pomocą metody Newtona (stycznych)

n = 1;
x_curr = x0;
err = inf;

while n <= n_max && err > delta
    x_next = x_curr - (f(x_curr)/df(x_curr));
    x_curr = x_next;
    err = abs(f(x_next));
    n = n + 1;
end

end