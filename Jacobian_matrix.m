%% Jacobian matrix
function [J]=Jacobian_matrix(V,P,Q,Y_mag,Theta, Vangle,numberbus,PQ,nPQ,B,G)

J1=zeros(numberbus-1);
J2=zeros(numberbus-1,nPQ);

J3=zeros(nPQ,numberbus-1);
J4=zeros(nPQ,nPQ);



for i=2:numberbus 
    for j=2:numberbus 
        if(j==i) 
                       
            J1(i-1,j-1)=-Q(i)-V(i)^2*B(i,j); 
        else
            J1(i-1,j-1)= -V(i)*V(j)*Y_mag(i,j)*sin(Theta(i,j)-Vangle(i)+Vangle(j));;
        end
    end
end


 for i=2:numberbus
     for j=1:nPQ  
         jj=PQ(j);         
         if(jj==i)     
             J2(i-1,j)=P(i)/V(i)+V(i)*G(i,i);
            
         else 
            J2(i-1,j)= V(i)*Y_mag(i,jj)*cos(Theta(i,jj)-Vangle(i)+Vangle(jj));
                 
         end
     end
 end
             

 for i=1:nPQ 
     ii=PQ(i);
     for j=2:numberbus 
         if(j==ii) 
             J3(i,j-1)=P(ii)-G(ii,ii)*(V(ii)^2); 
            
         else  
             J3(i,j-1)=-V(ii)*V(j)*Y_mag(ii,j)*cos(Theta(ii,j)-Vangle(ii)+Vangle(j));
         end
     end
 end
 
 
 for i=1:nPQ 
     ii=PQ(i);
     for j=1:nPQ 
         jj=PQ(j);
         if(jj==ii) 
             J4(i,j)=Q(ii)/V(ii)-V(ii)*B(ii,ii);
             
         else 
             J4(i,j)=-V(ii)*Y_mag(ii,jj)*sin(Theta(ii,jj)-Vangle(ii)+Vangle(jj));
                
         end
     end
 end
   J=[J1 J2;J3 J4];  
 end
 

