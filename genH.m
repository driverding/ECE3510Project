function H = genH(alpha, tauOverTs, L, N)
    H = zeros(1, N);
    k = 1:N;
    for l = 1:L
        H = H + alpha(l) .* exp((-2j * pi * tauOverTs(l)) / N .* k);
    end
end