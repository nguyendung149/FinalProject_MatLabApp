function nghiem =  gauss_jordan (A,B)
    AB = [A B'];
    for k = 1:length(B)
        AB(k,:) = AB(k,:)./AB(k,k);
        for m = 1:length(B)
            if m~=k
                AB(m,:) = AB(m,:) - AB(k,:).*AB(m,k);
            end
        end
    end
    c = size(AB);
    nghiem = round(AB(:,c(2)),4);
end
    