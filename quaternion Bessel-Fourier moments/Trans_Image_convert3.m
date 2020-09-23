function [y_0,x_0] = Trans_Image_convert3(f1,f2,f3,Matrix_c1_ii,Matrix_c1_jj,Matrix_c2);

%不转化为灰度图象，由三个通道进行
sum_F1 = sum(f1(:));
sum_F2 = sum(f2(:));
sum_F3 = sum(f3(:));

Matrix_Fx = (Matrix_c1_jj + Matrix_c2).*f1;
Matrix_Fy = (Matrix_c1_ii + Matrix_c2).*f1;
sum_Fx1 = sum(Matrix_Fx(:));
sum_Fy1 = sum(Matrix_Fy(:));

Matrix_Fx = (Matrix_c1_jj + Matrix_c2).*f2;
Matrix_Fy = (Matrix_c1_ii + Matrix_c2).*f2;
sum_Fx2 = sum(Matrix_Fx(:));
sum_Fy2 = sum(Matrix_Fy(:));

Matrix_Fx = (Matrix_c1_jj + Matrix_c2).*f3;
Matrix_Fy = (Matrix_c1_ii + Matrix_c2).*f3;
sum_Fx3 = sum(Matrix_Fx(:));
sum_Fy3 = sum(Matrix_Fy(:));

sum_F = sum_F1+sum_F2+sum_F3;
sum_Fx = sum_Fx1+sum_Fx2+sum_Fx3;
sum_Fy = sum_Fy1+sum_Fy2+sum_Fy3;
x_0 = double(sum_Fx / sum_F);
y_0 = double(sum_Fy / sum_F);