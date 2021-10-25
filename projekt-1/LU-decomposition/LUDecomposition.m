function [x] = LUDecomposition(A, b, n)
%LUDECOMPOSITION Funkcja rozwiązująca układy równań metodą rozkładu LU

L = eye(n, n);
y = zeros(n,1);
x = zeros(n,1);

if det(A) == 0
    disp('Macierz A nie jest nieosobliwa');
    return
end

for k = 1:n
    for i = k+1:n
        % Wykonuję eliminację Gaussa
        l_ik = A(i,k) / A(k,k);
        L(i,k) = l_ik;
        A(i,:) = A(i,:) - (l_ik*A(k,:));
    end
end
U = A;

% Dysponujemy jedynie rozkładem LU macierzy ->
% Nie mamy przekształconego wektora b

% Rozwiązujemy równanie Ly = b
for k = 1:n
    y(k) = (b(k) - L(k,:)*y) / L(k,k);
end

% Następnie rozwiązujemy równanie Ux = y
for k = n:-1:1
    x(k) = (y(k) - U(k,:)*x) / U(k,k);
end

end