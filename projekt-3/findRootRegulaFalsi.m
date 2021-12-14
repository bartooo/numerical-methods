function [a0_value, b0_value, c, c_value, n] = findRootRegulaFalsi(a0, b0, delta, epsilon, n_max)

a0_value = f1(a0);
b0_value = f1(b0);

[c, n] = regulaFalsi(a0, b0, delta, epsilon, n_max, @f1);
c_value = f1(c);

plot_f(a0, b0, 0.1, @f1, "brak", c, 0);
end