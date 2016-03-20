% создать признаки, основанные на SVD-разложении  (решение задачи CardioQVARK - Дьяконов Александр, ВМК МГУ)

% загрузить данные

cardio_loadtrain
%cardio_loadtrain_filtered
cardio_loadtest
%cardio_loadtest_filtered
Y = cardio_importfile('traininfo.txt');

y = Y(:,3);

% нулевые матрицы для заполнения
L = zeros([100 3]);
U1 = zeros([100 1000]);
U2 = zeros([100 1000]);
U3 = zeros([100 1000]);
V1 = zeros([100 300]);

for t=1:length(S)
    
    if ismember(t, [8 41 96 100]) % инверсия сигналов
        x = -S{t};
    else
        x = +S{t};
    end;
    [l, u1, u2, u3, v1] = cardio_extractSVDs(x);
    L(t,:) = l;
    U1(t,:) = u1;
    U2(t,:) = u2;
    U3(t,:) = u3;
    V1(t,:) = v1;

    disp(t);
end;

L2 = zeros([100 3]);
U12 = zeros([100 1000]);
U22 = zeros([100 1000]);
U32 = zeros([100 1000]);
V12 = zeros([100 300]);

for t=1:length(S2)
    

        x = +S2{t};

    [l, u1, u2, u3, v1] = cardio_extractSVDs(x);
    L2(t,:) = l;
    U12(t,:) = u1;
    U22(t,:) = u2;
    U32(t,:) = u3;
    V12(t,:) = v1;

    disp(t);
end;

%-----------------
% признаки

AU1 = abs(U1);
AU12 = abs(U12);
AU1 = AU1(:,[467 655]);
AU12 = AU12(:,[467 655]);

AU2 = abs(U2);
AU22 = abs(U22);
AU2 = AU2(:,[138 266 590]);
AU22 = AU22(:,[138 266 590]);

AU3 = abs(U2);
AU32 = abs(U22);
AU3 = AU3(:,[431 574 812]);
AU32 = AU32(:,[431 574 812]);

F = [AU1 AU2 AU3];
F2 = [AU12 AU22 AU32];
F = [F F.^2 ones([100 1])];
F2 = [F2 F2.^2 ones([250 1])];

a = zeros([size(F2,1), 1]);

savematrix('features_temp1.txt', [y F])
savematrix('features_temp2.txt', [a F2])


