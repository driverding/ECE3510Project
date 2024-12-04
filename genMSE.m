function MSE = genMSE(Hhat, H, N)
    MSE = sum(abs(Hhat - H) .^ 2) / N;
end
