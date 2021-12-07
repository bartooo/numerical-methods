function [x_next, value] = testNewtonMethod(x0, delta, n_max, f, df)
%TESTNEWTONMETHOD Test metody Newtona

figure(1);
x = linspace(2, 12);
plot(x, f(x), "DisplayName","f(x)=0.55*x*sin(x)-log(x+2)");
title('Znalezione miejsce zerowe za pomocą metody Newtona');

x_next = newtonMethod(x0, delta, n_max, f, df);
value = f(x_next);

hold on;
grid on;
legend("Location","best");
scatter(x0, f(x0), "DisplayName","Punkt początkowy");
scatter(x_next, f(x_next), "DisplayName","Znalezione miejsce zerowe");
line(xlim(), [0,0], 'Color', 'k', "DisplayName", "f(x)=0");
hold off;

end