function [eps] = machinePrecision()
% MACHINEPRECISION Funkcja wyznacza dokładność maszynową komputera

eps = 1.0;
a = 1.0 + (eps / 2.0);
% Dopóki liczba a jest uznawana przez komputer jako większa od zera
while (a > 1.0) 
    eps = eps / 2.0;
    a = 1.0 + (eps / 2.0);
end
end