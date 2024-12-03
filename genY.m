function Y = genY(H, X, snr, p)
    Y0 = H .* X;
    powY = sum(Y0 .* Y0) / size(Y0, 2);
    Y = awgn(H .* X, snr / p, powY, 'linear');
end

