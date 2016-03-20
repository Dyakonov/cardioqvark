% создать все признаки, которые нужны для финального решения  (решение задачи CardioQVARK - Дьяконов Александр, ВМК МГУ)
disp('ПРИЗНАКИ НА ОСНОВЕ SVD')
cardio_runSVDs

disp('ПРИЗНАКИ НА ОСНОВЕ СЛУЧАЙНЫХ SVD')
cardio_runSVDs_all

disp('ПРИЗНАКИ НА ОСНОВЕ СПЕКТРОГРАММ')
cardio_runspectrogram

disp('ПРИЗНАКИ ОРГАНИЗАТОРОВ')
cardio_runstandartfeatures