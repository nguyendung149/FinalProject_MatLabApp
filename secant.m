function [X,n]=secant(fun,xO,x1,err)
if nargin< 4
    err=le-5;
end
n=0;
while abs(x1-xO)>=err 
    x2 = xO;
    xO = x1;
    x1 = x1+(x1-x2)/(feval (fun,x2)/feval(fun,x1)-1); 
    n=n+1;
end
    X=x1;
end