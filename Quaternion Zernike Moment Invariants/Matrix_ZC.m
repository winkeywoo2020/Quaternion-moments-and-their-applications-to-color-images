function [C] = Matrix_ZC(q,N);

% C = zeros(N,N);
% for i = 0 : N - 1
%     for j = 0 : i
%         C(i + 1,j + 1) = 1.0;
%         if(i == j)
%             for k = 1 : i
%                 C(i + 1,j + 1) = C(i + 1,j + 1) * (q + i + k) / k;
%             end
%         else
%             for k = 1 : j
%                 C(i + 1,j + 1) = C(i + 1,j + 1) * (q + j + k) / k;
%             end
%             for k = 1 : i - j
%                 C(i + 1,j + 1) = C(i + 1,j + 1) * (q + 2 * j + k) / k;
%             end
%         end    
%         if(mod(i-j,2) == 1)
%             C(i + 1,j + 1) = -1 * C(i + 1,j + 1);
%         end
%     end
% end

C = zeros(N,N);
for i = 0 : N - 1
    for j = 0 : i
        C(i + 1,j + 1) = 1.0;
        if(i == j)
            for k = 1 : i
                C(i + 1,j + 1) = C(i + 1,j + 1) * (q + i + k) / k;
            end
        else
            for k = 1 : j
                C(i + 1,j + 1) = C(i + 1,j + 1) * (q + j + k) / k;
            end
            for k = 1 : i - j
                 C(i + 1,j + 1) = C(i + 1,j + 1) * (q + 2 * j + k) / k;
            end
        end   
        C(i + 1,j + 1) = C(i + 1,j + 1) * (q + 2 * i + 1);
        if(mod(i-j,2) == 1)
            C(i + 1,j + 1) = -1 * C(i + 1,j + 1);
        end
    end
end