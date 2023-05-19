function y = tichphanhinhthang(fx,a,b,N)    
    h = (b - a)/N;
    k = 1:N-1;
    y = (h/2).*(fx(a)+fx(b)+2.*sum(fx(a+k.*h)));
end