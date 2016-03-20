% считывание файлов *ucc.*  (решение задачи CardioQVARK - Дьяконов Александр, ВМК МГУ)
% F - признаки
% X - главная волна

function [F, X] = cardio_readucc(filename)

F = zeros([1 7]); % признаки
X = zeros([1 710]); % признаки

disp(sprintf('fileucc=%s', filename))

ffile = fopen (filename);

s = fgetl(ffile);
while(~isempty(s))
    j = find(s==',');
    name = s(1:j-1);
    val = str2num(s(j+1:end));
    
    
    switch name
        case 'error'
            F(1) = val;
        case 'quality'
            F(2) = val;
        case 'spqrst'
            F(3) = val;
        case 'spq'
            F(4) = val;
        case 'sqrs'
            F(5) = val;            
        case 'sst'
            F(6) = val;
        otherwise
            disp(sprintf('%s,%g', name, val));
    end
    
    %disp(sprintf('%s,%g', name, val));
    
    if (strcmp(name,'error')&&(val<0))
        return
    end
    s = fgetl(ffile);
end


% считывание волны
s = fgetl(ffile);
t=0;
while(~isempty(s)&&(ischar(s))) % +условие выхода?
    t = t+1;
    % disp(s);
    X(t) = str2num(s);
    s = fgetl(ffile);
end;

% X = X(1:t);
F(7) = t; % длина волны

fclose (ffile);