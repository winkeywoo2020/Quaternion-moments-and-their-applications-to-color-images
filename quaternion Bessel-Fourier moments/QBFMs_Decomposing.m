function [result]=QBFMs_Decomposing(f,order)
%   Parameters:
%   f: 2D RGB image
%   n,m:the order of the moment
%   v: the order of Bessel function of the first kind,n<k
%   result: matrix of translation-rotation invariants values with size (N+1)*(M+1)

f = double(f);
[Height,Width,s] = size(f);
fr=f(:,:,1);fg=f(:,:,2);fb=f(:,:,3);

[Tangle_r,coef]=QBFMs_ComputeCoef(fr,fg,fb,Height, Width, order);

Re_r=zeros(order);Re_g=zeros(order);Re_b=zeros(order);
Im_r=zeros(order);Im_g=zeros(order);Im_b=zeros(order);

result=zerosq(order);

for m=1:order
    CosAng = cos(m * Tangle_r);
    SinAng = sin(m * Tangle_r);
    for n=m:order
        Re_fr=coef(:,:,n).*fr.*CosAng;%%%分别计算RGB虚部
        Re_r(n,m)=sum(Re_fr(:));
        
        Re_fg=coef(:,:,n).*fg.*CosAng;
        Re_g(n,m)=sum(Re_fg(:));
        
        Re_fb=coef(:,:,n).*fb.*CosAng;
        Re_b(n,m)=sum(Re_fb(:));
        
        Im_fr=coef(:,:,n).*fr.*SinAng;%%%分别计算RGB虚部
        Im_r(n,m)=sum(Im_fr(:));
        
        Im_fg=coef(:,:,n).*fg.*SinAng;
        Im_g(n,m)=sum(Im_fg(:));
        
        Im_fb=coef(:,:,n).*fb.*SinAng;
        Im_b(n,m)=sum(Im_fb(:));
    end
end

A =(Im_r+Im_g+Im_b)/sqrt(3);  %%%本来应该是-(VPZM_R+VPZM_G+VPZM_B)/sqrt(3)，但由于前面求取VPZM_R时sin(jj * Theta)没有取负号
B =Re_r+(Im_b-Im_g)/sqrt(3);  %%%本来应该是FPZM_R+(VPZM_G-VPZM_B)/sqrt(3)，但由于前面求取VPZM_R时sin(jj * Theta)没有取负号
C =Re_g+(Im_r-Im_b)/sqrt(3);
D =Re_b+(Im_g-Im_r)/sqrt(3);
result=quaternion(A,B,C,D);

clear f*;
clear Re*;
clear Im*;
clear A*;
clear B*;
clear C*;
clear D*;
             