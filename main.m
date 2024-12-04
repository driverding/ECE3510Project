N = 1024;
p = 8;
l = 5;
alpha = [13 10 7 5 3];
tauOverTs = [0 5 12 30 50];

Xk = genX(p, n);
Hk = genH([13 10 7 5 3], [0 5 12 30 50], 5, n);
Yk = genY(Hk, Xk, 10, p);
XkHkPredict = fft(sqrt(ifft(corr(Yk, n), n) ./ n), n);
XkHkPredict(1) = 0;
hold on;
stem(0:n-1, abs(Xk .* Hk));
stem(0:n-1, abs(XkHkPredict));
legend("$|X(k)H(k)|$","$|X(k)H(k)|$ predict","Interpreter","latex","FontSize",16);