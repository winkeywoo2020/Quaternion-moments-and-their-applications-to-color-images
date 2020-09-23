function [ZC,ZD] = Function_MatrixZernikeCD(order);

HalfOrder = ceil((order+1)/2);
% ZC = zeros(HalfOrder,HalfOrder,order+1,HalfOrder);
% ZD = zeros(HalfOrder,HalfOrder,order+1,HalfOrder);
% 
% for q = 0:order
%     for ll = 0:floor((order-q)/2)
%         ZC(1:ll+1,1:ll+1,q+1,ll+1) = Matrix_ZC(q,ll + 1);
%         ZD(1:ll+1,1:ll+1,q+1,ll+1) = Matrix_ZD(q,ll + 1);
%     end
% end
ZC = zeros(HalfOrder,HalfOrder,order+1);
ZD = zeros(HalfOrder,HalfOrder,order+1);
for q = 0:order
    ll = floor((order-q)/2);
    ZC(1:ll+1,1:ll+1,q+1) = Matrix_ZC(q,ll + 1);
    ZD(1:ll+1,1:ll+1,q+1) = Matrix_ZD(q,ll + 1);
end