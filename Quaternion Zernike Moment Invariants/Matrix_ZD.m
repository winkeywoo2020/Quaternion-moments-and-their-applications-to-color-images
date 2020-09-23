function [D] = Matrix_ZD(q,N);

% D = zeros(N,N);
% for i = 0 : N - 1
%     for j = 0 : i
%         D(i + 1,j + 1) = 1.0;
%         if(i == j)
%             for k = 1 : i
%                 D(i + 1,j + 1) = D(i + 1,j + 1) * k / (q + i + k) ;
%             end
%         else
%             for k = 1 : j
%                 D(i + 1,j + 1) = D(i + 1,j + 1) * (i - j + k) / (q + i + k);
%             end
%             D(i + 1,j + 1) = D(i + 1,j + 1) * (q + 2 * j + 1) / (q + i + j + 1);
%         end    
%     end
% end

D = zeros(N,N);
for i = 0 : N - 1
    for j = 0 : i
        D(i + 1,j + 1) = 1.0;
        if(i == j)
            for k = 1 : i
                D(i + 1,j + 1) = D(i + 1,j + 1) * k / (q + i + k) ;
            end
        else
            for k = 1 : j
                D(i + 1,j + 1) = D(i + 1,j + 1) * (i - j + k) / (q + i + k);
            end
%             D(i + 1,j + 1) = D(i + 1,j + 1) * (q + 2 * j + 1) / (q + i + j + 1);  %%’≈ª‘‘≠¿¥
        end   
        D(i + 1,j + 1) = D(i + 1,j + 1) / (q + i + j + 1);
    end
end