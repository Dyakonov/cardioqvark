% найти максимумы - начала пульсовых волн (решение задачи CardioQVARK - Дьяконов Александр, ВМК МГУ)

function J = cardio_findmax2(x, k_pred, k_next, k_pred2, k_next2)

ln = length(x);

T = bsxfun(@plus, 1:(k_pred + 1 + k_next), (0:(ln - k_pred - 1 - k_next))');

T = x(T); % отрезки сигнала

J = find((T(:,k_pred + 1) == max(T, [], 2)) & any(T(:,(k_pred-k_pred2):k_pred)<0,2) & any(T(:,k_pred+1:(k_pred+1+k_next2))<0,2) )  + k_pred;