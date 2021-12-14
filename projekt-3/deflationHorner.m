function [q] = deflationHorner(a, alpha)
%DEFLATIONHORNER Funkcja przeprowadzająca deflację
% schematem Hornera

n = size(a, 1) - 1;
q = zeros(n+1, 1);

for i = n:-1:1
    q(n-i+2) = a(n-i+1) + q(n-i+1)*alpha;
end

q = q(2:n+1);
end