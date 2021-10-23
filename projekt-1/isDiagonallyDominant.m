function [boolean] = isDiagonallyDominant(A, n)
%ISDIAGONALLYDOMINANT Funckja sprawdzająca, czy macierz A jest silnie
%diagonalnie dominująca wierszowo lub kolumnowo

isRowDominant = 1;
isColumnDominant = 1;

% Sprawdzam czy macierz A jest silnie diagonalnie dominująca wierszowo
for i = 1:n
    a = abs(A(i,i));
    abs_sum = sum(abs(A(i, :))) - a;
    if a < abs_sum
        isRowDominant = 0;
        break
    end
end

% Sprawdzam czy macierz A jest silnie diagonalnie dominująca kolumnowo
for i = 1:n
    a = abs(A(i,i));
    abs_sum = sum(abs(A(:, i))) - a;
    if a < abs_sum
        isColumnDominant = 0;
        break
    end
end

if isRowDominant == 1 || isColumnDominant == 1
    boolean = 1;
else
    boolean = 0;
end

end