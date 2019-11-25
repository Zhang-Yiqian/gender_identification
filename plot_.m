clear
close all
addpath("lib/voicebox")
au = audioread('/Users/zhangyiqian/Documents/MATLAB/TIMIT/TRAIN/DR6/FAPB0/SA2.WAV');
n = awgn(au,5, 'measured');
a = v_specsub(n, 16000);
subplot(3, 1, 1)
plot(au(20000: 22000, 1))
xlim([0 1000])
title("audio signal", 'FontSize', 35)
subplot(3, 1, 2)
plot(n(20000: 22000, 1))
xlim([0 1000])
title("audio signal with 5dB WGN ", 'FontSize', 35)
subplot(3, 1, 3)
plot(a(20000: 22000, 1))
xlim([0 1000])
title("deniosed audio signal using spectral subtraction ", 'FontSize', 35)

