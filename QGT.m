function [result]=QGT(f,a)
% Parameters:
% f: the input RGB color image in quaternion-type.
% a: the rotation angle
% result: the quaternion Gyrator transform

f=convert(f,'double');
q=unit(quaternion(1,1,1));

[M,N]=size(f);
mm=[[0:M-1]-[M]/2]/sqrt(M);
nn=[[0:N-1]-[N]/2]/sqrt(N);
[x,y]=meshgrid(nn,fliplr(mm));
p=exp(-q*2*pi*x.*y*tan(a/2));
h=fftshift(exp(-q*2*pi*x.*y*sin(a)));
result=(ifft2(fft2(f.*p).*h)).*p;