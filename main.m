N = 1024;
p = 8;
l = 5;
alpha = [13 10 7 5 3];
tauOverTs = [0 5 12 30 50];
snr = 30;
MSETrial = 100000;

Xk = genX(p, N);
Hk = genH(alpha, tauOverTs, l, N);

AverageMSE = 0;
for i = 1:MSETrial
    Yk = genY(Hk, Xk, 10 ^ (snr / 20), p);
    XkHkPredict = fft(sqrt(ifft(corr(Yk .* Xk, N), N) ./ N), N) .* Xk;
    XkHkPredict(1) = Yk(1);
    HkPredict = fft(ifft(XkHkPredict, N) .* genWindow(N / p, N) * p, N);
    AverageMSE = AverageMSE + genMSE(HkPredict, Hk, N);
end
AverageMSE = AverageMSE / MSETrial

subplot(2,1,1);
stem(0:N-1, abs(Xk .* Hk));
hold on;
stem(0:N-1, abs(XkHkPredict));
legend("$|X(k)H(k)|$","$|X(k)H(k)|$ predict","Interpreter","latex","FontSize",16);
hold off;
subplot(2,1,2);
plot(0:N-1, abs(Hk));
hold on;
plot(0:N-1, abs(HkPredict));
legend("$|H(k)|$","$|H(k)|$ predict","Interpreter","latex","FontSize",16);
hold off;