function [Ea,d1]=QBFMD_fast(Br,Bt,order)

% Br: Bessel-Fourier moment of reference image
% Bt: Bessel-Fourier moment of transformed image
% F:  [Angle(Br)-Angle(Bt)]mod(2*pi)
% A:  Alpha
% w(n,m): normalized weighting factor

DF=zeros(order);F=zeros(order);
q=unit(quaternion(1,1,1));
for m=1:order
    for n=m:order
        DF(n,m)=angle((1/Bt(n,m))*Br(n,m),q);
    end
end
        
F=mod(DF,2*pi);
w=(abs(Br)+abs(Bt))/2;
sum_1=0;sum_2=0;
d=zeros(order);
for m=1:order
    for n=m:order
        if (m==1)
            d(n,m)=mod(F(n,m),2*pi);
        else
            CF=F(n,m)-(m-1)*A(m-1);
            d(n,m)=mod(CF,2*pi);
        end
    end
    
    for k=0:order-m
        sum_1=sum_1+w(m+k,m);
        sum_2=sum_2+w(m+k,m)*d(m+k,m);
    end
    s(m)=sum_1/m;
    d0(m)=sum_2/s(m)/m;
    
    if (m==1)
        A(m)=d0(m);
        c(m)=s(m);
    else
        A(m)=(c(m-1)*A(m-1)+s(m)*d0(m))/(c(m-1)+s(m));
        c(m)=c(m-1)+s(m);
    end
end
Ea=A(order)*180/pi;

Brt=2*w;
Sum_Brt=sum(Brt(:));
w1=Brt/Sum_Brt;
Drt=0;
for m=1:order
    for n=m:order
        F1=abs(F(n,m)-mod(m*A(order),2*pi));
        F2=min(F1,2*pi-F1);
        Drt=Drt+F2*w1(n,m);
    end
end
d1=Drt/pi;