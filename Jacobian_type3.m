function [A]=Jacobian_type3(i,j,ws,Ygen_abs,Ygen_angle,Ep_mag,Ep_angle,H,KD)
if i==j
    A11=0;
    A12=ws;
    A21=0;
    for m=1:4        
        if i~=m
        A21=A21+Ygen_abs(i,m)*Ep_mag(i)*Ep_mag(m)*sin(Ep_angle(i)-Ep_angle(m)-Ygen_angle(i,m))    
        end
    end 
    A21=1/(2*H(i))*A21;
    A22=-KD(i)/(2*H(i));
end
if i~=j
    A11=0;
    A12=0;
    A21=-1/(2*H(i))*(Ygen_abs(i,j)*Ep_mag(i)*Ep_mag(j)*sin(Ep_angle(i)-Ep_angle(j)-Ygen_angle(i,j)))        
    A22=0;
end
A=[A11,A12;A21,A22];
end