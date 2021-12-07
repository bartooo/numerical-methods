function [y] = df1(x)
    y = -(1/x+2) + 0.55*sin(x) + 0.55*x*cos(x);
end