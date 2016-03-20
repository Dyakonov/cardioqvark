% Признаки организаторов (решение задачи CardioQVARK - Дьяконов Александр, ВМК МГУ)

[F,X,P] = cardio_readalldata([pwd '\train\']); % 'D:\Competitions\Cardioqvark\train\'
[F2,X2,P2] = cardio_readalldata([pwd '\test\']); % 'D:\Competitions\Cardioqvark\test\'
Y = cardio_importfile('traininfo.txt');

F = [F P X];
F2 = [F2 P2 X2];

y = Y(:,3);
a = zeros([size(F2,1), 1]);
savematrix('features_tempsf1.txt', [y F(:,[2 5 8 11 20 30])])
savematrix('features_tempsf2.txt', [a F2(:,[2 5 8 11 20 30])])