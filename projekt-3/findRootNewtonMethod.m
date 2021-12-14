function [x0_value, x_end, x_end_value, n] = findRootNewtonMethod(x0, delta, n_max)

x0_value = f1(x0);
[x_end, n] = newtonMethod(x0, delta, n_max, @f1, @df1);
x_end_value = f1(x_end);

plot_f(2, 12, 0.1, @f1, x0, x_end, 1);

end