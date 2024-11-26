function MSE = genMSE(Hhat, H, N)
    MSE = 0;
    for k = 1:N
        MSE = MSE + abs(Hhat(k) - H(k)) ^ 2;
    end
    MSE = MSE / N;
end
