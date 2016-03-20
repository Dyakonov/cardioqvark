% Сохранение csv-матрицы (решение задачи CardioQVARK - Дьяконов Александр, ВМК МГУ)
function savematrix(filename, X)

fid = fopen(filename, 'wt', 'n');
fprintf(fid, ['%g' repmat(',%g', 1, (size(X,2)-1)) '\n'], X');
fclose(fid);