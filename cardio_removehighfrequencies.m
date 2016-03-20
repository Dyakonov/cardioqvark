% фильтр высоких частот (решение задачи CardioQVARK - Дьяконов Александр, ВМК МГУ)

function corrected = cardio_removehighfrequencies(ecg, samplingrate)    
    fresult=fft(ecg);
    l = round(length(fresult)*50/samplingrate);
    fresult(l:end-l+2) = 0;
    corrected=real(ifft(fresult));