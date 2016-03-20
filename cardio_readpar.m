% считывание файлов *БЕЗucc.*  (решение задачи CardioQVARK - Дьяконов Александр, ВМК МГУ)
% F - признаки

function F = cardio_readpar(filename)

F = zeros([1 17]); % признаки

names = {'HR bpm','SDNN ms','CV %','SI ','IRSA ','NArr %','NN50 ','pNN50 %','VLF %','LF %','HF %','TP ms^2','VLF ms^2','LF ms^2','HF ms^2','LF/HF ','IC '};

disp(sprintf('filepar=%s', filename))

ffile = fopen (filename);

s = fgetl(ffile);
while(~isempty(s)&&ischar(s))
    % disp(['!' s '!']);
    j = find(s==',');
    if isempty(j)
        return;
    end;
    name = [s(1:j(1)-1) s(j(2)+1:end)]; % имя + единицы измерения
    val = str2num(s(j(1)+1:j(2)-1)); % значение признака
    
    
    
    
    for k=length(names):-1:0
        if (k==0)
            disp(['newname=', name,'!']);
            break;
        end;
            
    
        if strcmp(name, names{k})
            F(k) = val;
            break;
        end;
    end

    s = fgetl(ffile);
end