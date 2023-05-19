function [dathuc Yn] = noisuy_newton(x_array,y_array,No)
   syms t  d
   mid = mean(x_array);
   h = abs(x_array(2) - x_array(1));
   d = 1;
   n = 0;
   if No < mid    %Newton tiến
       P(t) = y_array(1) + 0*t;
       for m = 1:length(x_array)-1
            for k = 1:length(y_array)-1
               y_array(k) = y_array(k+1) - y_array(k);
            end
            d = (t - m + 1)*d;
            P = P + (d/factorial(m))*y_array(1);
            y_array(length(y_array)  - n) = 0;
            n = n + 1;
       end
        a = (No - x_array(1))/h;
        dathuc = simplify(P);
        dathuc = str2func(['@(t)' char(dathuc)]);
        Yn = dathuc(a);
   else   %Newton lùi
       P(t) = y_array(length(y_array)) + 0*t;
        for m = 1:length(x_array)-1
            for k = 1:length(y_array)-1
               y_array(k) = y_array(k+1) - y_array(k);
            end
            d = (t + m - 1)*d;
            y_array(length(y_array) - m);
            P = P + (d/factorial(m))*y_array(length(y_array) - m);
            y_array(length(y_array)  - n) = 0;
            n = n + 1;  
        end
        a = (No - x_array(length(x_array)))/h;
        dathuc = simplify(P);
        dathuc = str2func(['@(t)' char(dathuc)]);
        Yn = dathuc(a);  
   end
end
            
            