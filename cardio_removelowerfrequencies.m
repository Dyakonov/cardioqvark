% фильтр низких частот (решение задачи CardioQVARK - Дьяконов Александр, ВМК МГУ)

function corrected = cardio_removelowerfrequencies(ecg, samplingrate)    
    fresult=fft(ecg);
    fresult(1 : round(length(fresult)*5/samplingrate))=0;
    fresult(end - round(length(fresult)*5/samplingrate)+1 : end)=0;
    corrected=real(ifft(fresult));