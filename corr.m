function R = corr(X, n)
    R = ifft(fft(X, n) .* fft(conj(circRev(X, n)), n));
end