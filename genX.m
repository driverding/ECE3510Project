function X = genX(p, N)
    X = zeros(1, N);
    for i = 1:p:N
        X(i) = 1;
    end
end