function [nghiem solanlap]=tieptuyen(f,a,b,saiso)
    syms x; 
    fd1 = str2func(['@(x)' char(diff(f(x)))]);
    fd2 = str2func(['@(x)' char(diff(f(x),2))]);
    nostop = 1;
    temp1 = double(solve(diff(f(x))));
    temp2 = double(solve(diff(fd1(x))));
    %Kiem tra f'(x) co doi dau trong khoang phan li nghiem hay khong
    if ~isempty(temp1)
         for i=1:length(temp1)
             if (temp1(i)<=b) && (temp1(i)>=a)
                 disp('Ham f'' doi dau trong khoang phan li nghiem');
                 nostop=0;
                 nghiem = 'khong xac dinh';
                 solanlap = 'khong xac dinh';
                 break;
             end
         end
     end
     %Kiem tra f"(x) co doi dau trong khoang phan li nghiem hay ko
     if ~isempty(temp2)
         for i=1:length(temp2)
             if (temp2(i)<=b) && (temp2(i)>=a)
                 disp('Ham f" doi dau trong khoang phan li nghiem');
                 nostop=0;
                 nghiem = 'khong xac dinh';
                 solanlap = 'khong xac dinh';
                 break;
             end
         end
     end
     if (nostop) %thuật toán phương pháp tiếp tuyến
        x0 = a;
        while f(x0)*fd2(x0)<=0
            if f(x0)==0
                nghiem = x0;
                solanlap = 0;
                return
            else
                x0 = b;
            end
        end
        nghiem=x0-(f(x0)/fd1(x0));
        solanlap=0;
        while abs(nghiem-x0)>=saiso
            x0=nghiem;
            nghiem = x0-(f(x0)/fd1(x0));
            solanlap=solanlap+1;
        end
        nghiem = double(nghiem);
    end
end