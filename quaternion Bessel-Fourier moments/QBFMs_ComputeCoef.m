function [Tangle_r,coef]=QBFMs_ComputeCoef(fr,fg,fb,Height, Width, order)

%%%映射到单位圆内
c1 = sqrt(2) / (max(Height,Width) - 1);
c2 = - 1 / sqrt(2);

Matrix_c1 = c1*ones(Height,Width);
Matrix_c2 = c2*ones(Height,Width);
Matrix_ii = (0:Height-1)'*ones(1,Width);
Matrix_jj = ones(Height,1)*(0:Width-1);
Matrix_c1_ii = Matrix_c1.*Matrix_ii;
Matrix_c1_jj = Matrix_c1.*Matrix_jj;
[fr_y_0,fr_x_0] = CommonCentroidRGB(fr,fg,fb,Matrix_c1_ii,Matrix_c1_jj,Matrix_c2);
    
r_r_i = Matrix_c1_ii + Matrix_c2 - fr_y_0*ones(Height,Width);%%%平移到图像中心
r_r_j = Matrix_c1_jj + Matrix_c2 - fr_x_0*ones(Height,Width);
r_r = sqrt(r_r_i.*r_r_i + r_r_j.*r_r_j);%%%半径
Tangle_r = atan2(r_r_j,r_r_i);%%%角度


%k=10;
%w=besselzero(1,k,1); %%besselzero(n,k,kind): find first k positive zeros of the Bessel function J(n,x) or Y(n,x)，v为贝塞尔函数的阶次 
w=[3.8317 7.0156 10.1735 13.3237 16.4706 19.6159 22.7601 25.9037 29.0468 32.1897 35.3323 38.4748];

coef=zeros(size(r_r,1),size(r_r,1),order);
for n=1:order
    a=(besselj(2,w(n+1)))^2; %%besselj(nu,Z) computes the Bessel function of the first kind, Jν(z), for each element of the array Z
    P=2/a/3.14/(Height-1)/(Height-1);
    coef(:,:,n)=P*besselj(1,w(n+1)*r_r);
end


