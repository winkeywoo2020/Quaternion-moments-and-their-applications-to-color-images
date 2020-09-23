function [Q] = Main_Test()
clear all;
f = imread('G:\original\4.2.06_256.tiff');
%% % Transform axis, a unit pure quaternion. 
mu = quaternion(0, 1/sqrt(3), 1/sqrt(3), 1/sqrt(3)); 
alpha = x(mu) / abs(mu);
beta = y(mu) / abs(mu);
gama = z(mu) / abs(mu);

% %%%QZMIs
order = 5;
[ZC,ZD] = Function_MatrixZernikeCD(order);
% Q = zerosq(ceil((order+1)*(order+3)/4)-1);
Q = QZM_RST_Fast4(f,order,ZC,ZD,alpha,beta,gama);

function [ResultQ1]=QZM_RST_Fast4(f,order,ZC,ZD,aa,bb,cc)
%   Parameters:
%   f: 2D color image 
%   order: max moment order
%   ResultQ2: RST values

f = double(f);
fr = f(:,:,1);
fg = f(:,:,2);
fb = f(:,:,3);

% % %%%coefficient mapping
[Height,Width,dim] = size(f);
c1 = sqrt(2) / (max(Height,Width) - 1);
c2 = - 1 / sqrt(2);
coef= 2 / (pi * (max(Height,Width) - 1) ^ 2);
Matrix_c1 = c1*ones(Height,Width);
Matrix_c2 = c2*ones(Height,Width);
Matrix_ii = (0:Height-1)'*ones(1,Width);
Matrix_jj = ones(Height,1)*(0:Width-1);
Matrix_c1_ii = Matrix_c1.*Matrix_ii;
Matrix_c1_jj = Matrix_c1.*Matrix_jj;

%%%Centroid and Mapped to the polar coordinate system
[fr_y_0,fr_x_0] = Trans_Image_convert3(fr,fg,fb,Matrix_c1_ii,Matrix_c1_jj,Matrix_c2); 
r_r_i = Matrix_c1_ii + Matrix_c2 - fr_y_0;
r_r_j = Matrix_c1_jj + Matrix_c2 - fr_x_0;
r_r = sqrt(r_r_i.*r_r_i + r_r_j.*r_r_j);
Tangle_r = atan2(r_r_i,r_r_j);
  
%%%Computing quaternion Zernike 
QZernike = zerosq(order + 1);
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
        %%%Real-valued radial polynomial
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
%%%Quaternion Zernike moments
QZernike = quaternion(-aa*VPZM_R-bb*VPZM_G-cc*VPZM_B,FPZM_R+cc*VPZM_G-bb*VPZM_B,FPZM_G+aa*VPZM_B-cc*VPZM_R,FPZM_B+bb*VPZM_R-aa*VPZM_G);
clear r_r*;
clear Matrix*;
clear Tangle_r;
clear CosAng;
clear SinAng;
clear FPZM*;
clear VPZM*;
clear R_r*;

%%%Quaternion Zernike moment scaling invariants
Gamma = sqrt(abs(QZernike(1,1)));
% index = 1;
Q = zerosq(order+1);
for m = 0:order
    ll = floor((order-m)/2);
    M_Gamma = zeros(1,ll+1);
    for ii = 0 : ll
        M_Gamma(ii + 1) = Gamma ^ (-(m + 2 * ii + 2));
    end
      
    Q(m+1:2:m+1+2*ll,m+1) = ZC(1:ll+1,1:ll+1,m+1) * diag(M_Gamma) * ZD(1:ll+1,1:ll+1,m+1) * QZernike(m+1:2:m+1+2*ll,m+1);
end

%%%Quaternion Zernike moment rotation invariants
ResultQ = zerosq(order+1,order+1);
RotationalComponent = (diag(Q))';
ResultQ(:,1) = Q(:,1);
ResultQ(:,2:end) = Q(:,2:end) .* repmat(RotationalComponent(2:end),order+1,1);
ResultQ = conj(ResultQ');
ResultQ1 = ResultQ(find(abs(ResultQ)>0));
ResultQ1 = ResultQ1(3:end);  %%abs(ResultQ1£¨1£©)==1£¬ResultQ1£¨2£©==0
