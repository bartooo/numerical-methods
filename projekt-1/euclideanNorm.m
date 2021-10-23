function [res] = euclideanNorm(x)
%EUCLIDEANNORM Funkcja licząca normę euklidesową

res = sqrt(sum(abs(x).^2));
end