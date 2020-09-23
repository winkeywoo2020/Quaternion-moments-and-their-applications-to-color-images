function [QFMM]=QFMM_Fast(f,order,alpha,beta,gama,r_r,Tangle_r,coef)
%   Parameters:
%   f: 2D image 
%   order: max moment order
%   QFMM: QFMM values

f = double(f);
fr=f(:,:,1);
fg=f(:,:,2);
fb=f(:,:,3);

 %%%real-valued radial polynomial of each order
for m = 0 : order 
    R_r(:,:,m + 1) = r_r .^ (m-2);
end

FPZM_R = zeros(order + 1,order + 1);
VPZM_R = zeros(order + 1,order + 1);
FPZM_G = zeros(order + 1,order + 1);
VPZM_G = zeros(order + 1,order + 1);
FPZM_B = zeros(order + 1,order + 1);
VPZM_B = zeros(order + 1,order + 1);

%%%Fourier-Mellin moments for each channel 
for j = 0 : order 
    CosAng = coef * cos(j*Tangle_r);
    SinAng = -coef * sin(j*Tangle_r);
    for i = 0 : order
            temp_M = CosAng .* R_r(:,:,i + 1);
            temp_M1 = fr .*temp_M;
            FPZM_R(i+1,j+1) = sum(temp_M1(:));
            temp_M1 = fg .*temp_M;
            FPZM_G(i+1,j+1) = sum(temp_M1(:));
            temp_M1 = fb .*temp_M;
            FPZM_B(i+1,j+1) = sum(temp_M1(:));
            
            temp_M = SinAng .* R_r(:,:,i + 1);
            temp_M1 = fr .*temp_M;
            VPZM_R(i+1,j+1) = sum(temp_M1(:));
            temp_M1 = fg .*temp_M;
            VPZM_G(i+1,j+1) = sum(temp_M1(:));
            temp_M1 = fb .*temp_M;
            VPZM_B(i+1,j+1) = sum(temp_M1(:));
    end
end

%%Computing Quaternion Fourier-Mellin moments
QFMM = quaternion(-alpha*VPZM_R-beta*VPZM_G-gama*VPZM_B,FPZM_R+gama*VPZM_G-beta*VPZM_B,...
    FPZM_G+alpha*VPZM_B-gama*VPZM_R,FPZM_B+beta*VPZM_R-alpha*VPZM_G);

clear fr*;
clear fg*;
clear fb*;
clear FPZM_R*;
clear VPZM_R*;
clear FPZM_G*;
clear VPZM_G*;
clear FPZM_B*;
clear VPZM_B*;