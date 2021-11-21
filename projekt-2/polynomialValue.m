function [values] = polynomialValue(a, x)
%POLYNOMIALVALUE Liczy wartość wielomianu o danych współczynnikach 
values = zeros(size(x,1),1);
for i = 1:size(x,1)
    for j = 1:size(a,1)
        values(i) = values(i) + a(j) * (x(i)^(j-1));
    end
end
end