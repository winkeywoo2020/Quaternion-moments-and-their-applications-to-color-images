function [QZernike]=QZM_Fast(f,order,alpha,beta,gama,r_r,Tangle_r,coef)
%   Parameters:
%   f: 2D color image 
%   order: max moment order
%   alpha,beta,gama: mu=alpha*i+beta*j+gama*k  Transform axis, a unitpure quaternion.  
%   QZernike: QZM values

f = double(f);
fr = f(:,:,1);
fg = f(:,:,2);
fb = f(:,:,3);

CosAng = zeros(size(r_r,1),size(r_r,2),order+1);
SinAng = zeros(size(r_r,1),size(r_r,2),order+1);
for m = 0 : order    
    CosAng(:,:,m+1) = coef * cos(m * Tangle_r);
    SinAng(:,:,m+1) = -coef * sin(m * Tangle_r);
end
FPZM_R = zeros(order + 1);
VPZM_R = zeros(order + 1);
FPZM_G = zeros(order + 1);
VPZM_G = zeros(order + 1);
FPZM_B = zeros(order + 1);
VPZM_B = zeros(order + 1);

for m = 0 : order 
    for n = m : 2 : order
        %%%real-valued radial polynomial of each order
        if(n==m)
            R_r = r_r .^ m;
            R1 = R_r;
        elseif(n==(m + 2))
            R_r = n * r_r .^ n - (n - 1) * R1;
            R2 = R_r;
        else
            K1 = (n + m) * (n - m) * (n - 2) / 2;
            K2 = 2 * n * (n - 1) * (n - 2);
            K3 = -(n - 1) * (m ^ 2 + n * (n - 2));
            K4 = -n * (n + m - 2) * (n - m - 2)/ 2;
			R_r = ((K2 * r_r .^ 2 + K3) .* R2 + K4 * R1) / K1;
            R1=R2;
            R2=R_r;
        end
        %%%Zernike moments for each channel 
        temp_M = (n + 1) * R_r .* CosAng(:,:,m+1);
        temp_M1 = fr .*temp_M;
        FPZM_R(n+1,m+1) = sum(temp_M1(:));
        temp_M1 = fg .*temp_M;
        FPZM_G(n+1,m+1) = sum(temp_M1(:));
        temp_M1 = fb .*temp_M;
        FPZM_B(n+1,m+1) = sum(temp_M1(:));
            
        temp_M = (n + 1) * R_r .* SinAng(:,:,m+1);
        temp_M1 = fr .*temp_M;
        VPZM_R(n+1,m+1) = sum(temp_M1(:));
        temp_M1 = fg .*temp_M;
        VPZM_G(n+1,m+1) = sum(temp_M1(:));
        temp_M1 = fb .*temp_M;
        VPZM_B(n+1,m+1) = sum(temp_M1(:));
    end
end

%%Computing Quaternion Zernike moments
QZernike = quaternion(-alpha*VPZM_R-beta*VPZM_G-gama*VPZM_B,FPZM_R+gama*VPZM_G-beta*VPZM_B,...
    FPZM_G+alpha*VPZM_B-gama*VPZM_R,FPZM_B+beta*VPZM_R-alpha*VPZM_G);

clear CosAng;
clear SinAng;
clear FPZM*;
clear VPZM*;
clear R_r*;