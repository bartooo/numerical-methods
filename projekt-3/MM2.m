function [x_next, n] = MM2(x0, delta, n_max, f, df, ddf)
%MM2 Funkcja znajdująca pierwiastek wielomianu metodą MM2

x_next = x0;
n = 1;
err = inf;

while n < n_max && err > delta
    x_curr = x_next;
    s_root = sqrt((polynomialValue(df, x_curr)^2) - 2*polynomialValue(f, x_curr)*polynomialValue(ddf, x_curr));
    z_plus = -2*polynomialValue(f, x_curr) / (polynomialValue(df, x_curr) + s_root);
    z_minus = -2*polynomialValue(f, x_curr) / (polynomialValue(df, x_curr) - s_root);

    if abs(polynomialValue(df, x_curr) + s_root) >= abs(polynomialValue(df, x_curr) - s_root)
        z_min = z_plus;
    else
        z_min = z_minus;
    end
    
    x_next = x_curr + z_min;
    err = abs(polynomialValue(f, x_next));
    n = n + 1;
end
end