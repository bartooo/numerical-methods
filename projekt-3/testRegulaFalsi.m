function [c, value] = testRegulaFalsi(a0, b0, delta, n_max, f)
%TESTREGULAFALSI Test metody regula falsi

figure(1);
x = linspace(a0, b0);
plot(x, f(x), "DisplayName","f(x)=0.55*x*sin(x)-log(x+2)");
title('Znalezione miejsce zerowe za pomocą metody regula falsi');

hold on;
grid on;
c = regulaFalsi(a0, b0, delta, n_max, f);
value = f(c);
scatter(c, f(c), "DisplayName", "Znalezione miejsce zerowe");
legend("Location","best");
line(xlim(), [0,0], 'Color', 'k', "DisplayName", "f(x)=0");
hold off;

end