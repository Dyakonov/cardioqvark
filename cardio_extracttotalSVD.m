% Извлечь компоненты сингулярного разложения отрезков волн (решение задачи CardioQVARK - Дьяконов Александр, ВМК МГУ)
% отрезки длины 1000 от случайных точек

function [l, u1, u2, u3] = cardio_extracttotalSVD(x)
% преобразование сигнала
x = cardio_removelowerfrequencies(x, 1000);
x = cardio_removehighfrequencies(x, 1000);
% J = cardio_findmax2(x, 400, 400, 50, 50);


rng(1);
r = randperm(290000);
r = r(1:10000);
indxs = bsxfun(@plus, r',0:999);
X = x(indxs)';
[U,L,V] = svds(X,3);

l = diag(L)';
u1 = U(:,1)';
u2 = U(:,2)';
u3 = U(:,3)';
