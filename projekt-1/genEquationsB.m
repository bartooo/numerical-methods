function [A, b] = genEquationsB(n)
%GENEQUATIONSB Funkcja generująca układy równań zdefiniowane w pkt. B

A = zeros(n, n);
b = zeros(n, 1);
for i = 1:n
    for j = 1:n
        A(i, j) = 4*(i-j) + 2;
        A(i, i) = 1/3;
    end
    b(i) = 3.5 - 0.4*i;
end
end