function [nghiem solanlap]=lap(fp,a,b,saiso)
    syms x
    fd1 = str2func(['@(x)' char(diff((fp(x))))]);
    if (abs(fd1(a))>=1)||(abs(fd1(b))>=1)
        disp('Không hội tụ')
        return
    end
    x0 = a;
    x1 = fp(x0);
    solanlap=1;
    while abs(x1-x0)>= saiso
        x0 = x1;
        x1 = fp(x0);
        solanlap=solanlap+1;
    end
    nghiem = x1;
end