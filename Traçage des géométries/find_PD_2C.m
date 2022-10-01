function find_PD_2C(yourSignal,threshold,snr)
    for i = 1:length(snr)
        Pd_buff(100) = 0;
        for j = 1:100
            noisySignal = awun(yourSignal,snr(i));
            [acor, ~] = xcorr(noisySignal,yourSignal);
            Pd_buff(j) = sum(abs(acor) > threshold)/length(acor);
        end
        Pd = sum(Pd_buff)/100;
        plot(snr(i),Pd,'+')
        hold on
    end
    title('Cross Correlation')
    ylabel('Probability of Detection')
    xlabel('SNR dB')
    hold off
end