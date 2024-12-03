function XR = circRev(X, n)
    XR = X;
    for i = 2:n
        XR(i) = X(n + 2 - i);
    end
end