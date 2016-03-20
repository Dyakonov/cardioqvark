% Извлечь компоненты сингулярного разложения отрезков волн (решение задачи CardioQVARK - Дьяконов Александр, ВМК МГУ)
% отрезки от J-максимумов длины 1000

function [l, u1, u2, u3, v1] = cardio_extractSVDs(x)
% преобразование сигнала
x = cardio_removelowerfrequencies(x, 1000);
x = cardio_removehighfrequencies(x, 1000);
J = cardio_findmax2(x, 400, 400, 50, 50);

indxs = bsxfun(@plus, J(J<=(length(x)-1000)),0:999);
X = x(indxs)';
[U,L,V] = svds(X,3);
l = diag(L)';
u1 = U(:,1)';
u2 = U(:,2)';
u3 = U(:,3)';
v1 = zeros([1 300]);
q = min(size(V,1), 300);
v1(1:q) = V(1:q,1)';
