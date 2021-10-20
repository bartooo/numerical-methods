function [x] = LUDecomposition(A, b, n)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
L = eye(n,n);
U = zeros(n,n);
U(1,:) = A(1,:);
for k = 1:n
    for i = k+1:n
        % Wykonuję eliminację Gaussa
        l_ik = A(i,k) / A(k,k);
        L(i,k) = l_ik;
        A(i,:) = A(i,:) - (l_ik*A(k,:));
        U(i,:) = A(i,:);
    end
end
% Dysponujemy jedynie rozkładem LU macierzy ->
% Nie mamy przekształconego wektora b

% Rozwiązujemy równanie Ly = b
y = L\b;

% Następnie rozwiązujemy równanie Ux = y
x = U\y;

end