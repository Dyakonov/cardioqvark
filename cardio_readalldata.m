% загрузка данных ucc и par-файлы  (решение задачи CardioQVARK - Дьяконов Александр, ВМК МГУ)
% F - признаки из ucc-файла
% X - главная волна
% P - признаки из par-файла
% FN - имя файла (не использую)

function [F,X,P,FN] = cardio_readalldata(catalogname)

% catalogname D:\Competitions\Cardioqvark\train\
% загрузка ucc и par (дабавил позже)
maskname = [catalogname '*ucc.csv'];
files = dir(maskname); % список директорий

F = [];
X = [];
P = [];
FN = {};

for ifile=1:length(files)
    fname = files(ifile).name;
    filename = [catalogname fname];
    
    [F(end+1,:), X(end+1,:)] = cardio_readucc(filename); % признаки + волна
    filename(end-7:end-4) = [];
    P(end+1,:) = cardio_readpar(filename); % признаки
    FN{end+1} = fname; % имя файла
    %disp(fname);
end;