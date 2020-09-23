function [y_0,x_0] = Trans_Image_convert3(f1,f2,f3,Matrix_c1_ii,Matrix_c1_jj,Matrix_c2);

%转化为灰度图象
% c1 = sqrt(2) / (Width - 1);
% c2 = - 1 / sqrt(2);
% 
% for i = 1 : Height
%     for j = 1 : Width
%         gf(i,j) = (f1(i,j) + f2(i,j) + f3(i,j))/3;
%     end
% end
% 
% sum_F = sum(gf(:));
% 
% sum_Fx = 0;
% sum_Fy = 0;
% 
% for i = 0 : Height - 1
%     for j = 0 : Width - 1
%         
%         x = c1 * j + c2;
%         sum_Fx = sum_Fx + x * gf(i + 1,j + 1);
%         
%         y = c1 * i + c2;        
%         sum_Fy = sum_Fy + y * gf(i + 1,j + 1);
%     end
% end
% 
% x_0 = double(sum_Fx / sum_F);
% y_0 = double(sum_Fy / sum_F);

%不转化为灰度图象，由三个通道进行
sum_F1 = sum(f1(:));
sum_F2 = sum(f2(:));
sum_F3 = sum(f3(:));

% sum_Fx1 = 0;
% sum_Fy1 = 0;
% sum_Fx2 = 0;
% sum_Fy2 = 0;
% sum_Fx3 = 0;
% sum_Fy3 = 0;
% 
% for i = 0 : Height - 1
%     y = c1 * i + c2;  
%     for j = 0 : Width - 1
%         
%         x = c1 * j + c2;
%         sum_Fx1 = sum_Fx1 + x * f1(i + 1,j + 1);
%         sum_Fx2 = sum_Fx2 + x * f2(i + 1,j + 1);
%         sum_Fx3 = sum_Fx3 + x * f3(i + 1,j + 1);
%           
%         sum_Fy1 = sum_Fy1 + y * f1(i + 1,j + 1);
%         sum_Fy2 = sum_Fy2 + y * f2(i + 1,j + 1);
%         sum_Fy3 = sum_Fy3 + y * f3(i + 1,j + 1);
%     end
% end
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