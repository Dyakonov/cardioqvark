% Построить признаки по спектрограммам сигналов (решение задачи CardioQVARK - Дьяконов Александр, ВМК МГУ)

cardio_loadtrain
%cardio_loadtrain_filtered
cardio_loadtest
%cardio_loadtest_filtered
Y = cardio_importfile('traininfo.txt');
y = Y(:,3);


F =[];
for i=1:100
    x = S{i};
    [s,f,t] = spectrogram(x,1000,0);
    s2 = log(abs(s));
    F(:,i) = mean(abs(diff(s2'))); % mean(s2,2)
    disp(i)
end;

F2 =[];
for i=1:250
    x = S2{i};
    [s,f,t] = spectrogram(x,1000,0);
    s2 = log(abs(s));
    F2(:,i) = mean(abs(diff(s2'))); %mean(s2,2)
    disp(i)
end;

F = F';
F2 = F2';


F2(isnan(F2)) = 0;
F(isinf(F)) = 1;
F2(isinf(F2)) = 1;

a = zeros([size(F2,1), 1]);

savematrix('features_tempfftabsdiff1.txt', [y F(:,[8 104 296 369 506])])
savematrix('features_tempfftabsdiff2.txt', [a F2(:,[8 104 296 369 506])])