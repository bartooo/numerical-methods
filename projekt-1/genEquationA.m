function [A,b] = genEquationA(n)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
A = zeros(n,n);
b = zeros(n,1);
for i = 1:n
    for j = 1:n
        if i == j
            A(i,j) = 7;
        elseif i == j-1 || i == j+1
            A(i,j) = 3;
        else
            A(i,j) = 0;
        end
    end
    b(i) = 2.5 + 0.5*i;
end

end