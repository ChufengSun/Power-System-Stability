
function [P,Q]=PQ(V,Y_mag,Theta,Vangle,numberbus) 

P=zeros(numberbus,1); 
Q=zeros(numberbus,1); 
     for i=1:numberbus
         for j=1:numberbus
             P(i)=P(i)+V(i)*V(j)*Y_mag(i,j)*cos(Theta(i,j)-Vangle(i)+Vangle(j));
             Q(i)=Q(i)-V(i)*V(j)*Y_mag(i,j)*sin(Theta(i,j)-Vangle(i)+Vangle(j));
         end
     end
end


