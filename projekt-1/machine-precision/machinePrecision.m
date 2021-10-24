function [eps] = machinePrecision()
% MACHINEPRECISION Funkcja wyznacza dokładność maszynową komputera

g = 1.0;
a = 1.0 + g;
% Dopóki liczba a jest uznawana przez komputer jako większa od zera
while (a > 1.0)
    eps = g; % Zapamiętuję poprzednią liczbę g
    g = g / 2.0; % Zmniejszam liczbę g
    a = 1.0 + g;
end
end