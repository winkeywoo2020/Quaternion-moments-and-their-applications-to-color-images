function [MatrixR,Theta,Coef] = ComputeQBFMCoef(Height,Width,order)

c1 = sqrt(2) / (Width - 1);
c2 = -1 / sqrt(2);

Matrix_c1 = c1*ones(Height,Width);
Matrix_c2 = c2*ones(Height,Width);
Matrix_ii = (0:Height-1)'*ones(1,Width);
Matrix_jj = ones(Height,1)*(0:Width-1);
Matrix_c1_ii = Matrix_c1.*Matrix_ii;
Matrix_c1_jj = Matrix_c1.*Matrix_jj;
r_r_i = Matrix_c1_ii + Matrix_c2;
r_r_j = Matrix_c1_jj + Matrix_c2;
MatrixR = sqrt(r_r_i.*r_r_i + r_r_j.*r_r_j);
Theta = atan2(r_r_j,r_r_i);

for m = 0 : order
    w=besselzero(1,order+1,1); %%besselzero(n,k,kind): find first k positive zeros of the Bessel function J(n,x) or Y(n,x)，v为贝塞尔函数的阶次 
    a=0.5*(besselj(2,w(m+1)))^2; %%besselj(nu,Z) computes the Bessel function of the first kind, Jν(z), for each element of the array Z
    Coef(m+1) = 1 / (a*pi * (Width - 1) ^ 2);
end