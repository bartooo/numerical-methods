function [q] = polynomialDerivative(a)
%POLYNOMIALDERIVATIVE Wylicza współczynniki pochodnej wielomianu
q = zeros(size(a,1)-1,1);

for i = 1:size(a,1)-1
    q(i) = a(i) * (size(a,1)-i);
end

end