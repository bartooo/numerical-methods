function [values] = polynomialValue(a, x)
%POLYNOMIALVALUE Liczy wartość wielomianu o danych współczynnikach 
values = zeros(size(x,1),1);
for i = 1:size(x,1)
    for j = size(a,1):-1:1
        values(i) = values(i) + a(size(a,1)-j+1) * (x(i)^(j-1));
    end
end
end