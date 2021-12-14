function [] = plot_f(a, b, step, funct, x0, x_end, isNewton)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
x=a:step:b;
y = zeros(1, size(x,2));
n_iter = 1;
for i = a:step:b
    y(1, n_iter) = funct(i);
    n_iter = n_iter + 1;
end
figure()
plot(x,y, "DisplayName","f(x)=0.55*x*sin(x)-log(x+2);");

xlim = get(gca,'xlim');
hold on
plot([xlim(1) xlim(2)],[0 0],'k', "DisplayName", "y=0");
rectangle('Position',[2, -20, 6, 25], 'FaceColor',[255/255, 204/255, 255/255, 0.3], 'EdgeColor', [255/255, 204/255, 255/255, 0.1])
rectangle('Position',[8, -20, 4, 25], 'FaceColor',[204/255, 255/255, 255/255, 0.3], 'EdgeColor', [204/255, 255/255, 255/255, 0.1])
grid on;
xlabel('x');
ylabel('f(x)');
legend("Location","best");
if isNewton == 1
    scatter(x0, f1(x0), "DisplayName","Punkt początkowy");
end

scatter(x_end, f1(x_end), "DisplayName","Znalezione miejsce zerowe");
hold off;

end