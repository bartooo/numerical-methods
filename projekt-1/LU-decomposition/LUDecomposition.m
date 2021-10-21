function [x] = LUDecomposition(A, b, n)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
L = eye(n,n);
U = zeros(n,n);
y = zeros(n,1);
x = zeros(n,1);
U(1,:) = A(1,:);

for k = 1:n
    for j = k+1:n
        % Wykonuję eliminację Gaussa
        l_ik = A(j,k) / A(k,k);
        L(j,k) = l_ik;
        A(j,:) = A(j,:) - (l_ik*A(k,:));
        U(j,:) = A(j,:);
    end
end

% Dysponujemy jedynie rozkładem LU macierzy ->
% Nie mamy przekształconego wektora b

% Rozwiązujemy równanie Ly = b
for k = 1:n
    sum = 0;
    for j = 1:k-1
        sum = sum + L(k,j)*y(j);
    end
    y(k) = (b(k) - sum) / L(k,k);
end

% Następnie rozwiązujemy równanie Ux = y
for k = n:-1:1
    sum = 0;
    for j = k+1:n
        sum = sum + U(k,j)*x(j);
    end
    x(k) = (y(k) - sum) / U(k,k);
end

end