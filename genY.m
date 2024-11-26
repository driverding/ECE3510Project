function Y = genY(H, X, snr, p)
    Y = awgn(H .* X, snr / p);
end

