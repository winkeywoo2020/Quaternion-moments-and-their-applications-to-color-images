function [Q] = Main_QTMs()
clear all;
bool = 'QZM';
order = 5;
f = imread('G:\original\4.2.06_256.tiff');

%% % Transform axis, a unit pure quaternion. 
mu = quaternion(0, 1/sqrt(3), 1/sqrt(3), 1/sqrt(3)); 
alpha = x(mu) / abs(mu);
beta = y(mu) / abs(mu);
gama = z(mu) / abs(mu);

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
r_r_i = Matrix_c1_ii + Matrix_c2;
r_r_j = Matrix_c1_jj + Matrix_c2;
r_r = sqrt(r_r_i.*r_r_i + r_r_j.*r_r_j);
Tangle_r = atan2(r_r_i,r_r_j);

%%%Computing different QTMs
Q = zerosq(order+1);
switch bool
    case 'QFMM'
        Q = QFMM_Fast(f,order,alpha,beta,gama,r_r,Tangle_r,coef);
    case 'QZM'
        Q = QZM_Fast(f,order,alpha,beta,gama,r_r,Tangle_r,coef);
    case 'QPZM'
        Q = QPZM_Fast(f,order,alpha,beta,gama,r_r,Tangle_r,coef);
    case 'QOFMM'
        Q = QOFMM_Fast(f,order,alpha,beta,gama,r_r,Tangle_r,coef);
    case 'QROTM'
        Q = QROTM_Fast(f,order,alpha,beta,gama,r_r,Tangle_r,coef);
end
abs(Q)