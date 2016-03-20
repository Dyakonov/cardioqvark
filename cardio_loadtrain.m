% загрузка данных (обучение) из каталога: только wav-файлы  (решение задачи CardioQVARK - Дьяконов Александр, ВМК МГУ)

catalogname = [pwd '\train\']; % название каталога с данными D:\Competitions\Cardioqvark\train\
files = dir([catalogname '*.wav']); % список директорий

S = {}; 
FN = {};

for ifile=1:length(files)
    fname = files(ifile).name;
    if (~strcmp(fname(end-11:end-4),'filtered'))
        ffile = [catalogname fname];
        S{end+1} = wavread(ffile);
        FN{end+1} = fname;
        disp(fname)
    end;
    
end;
