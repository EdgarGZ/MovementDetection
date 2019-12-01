%% Umbralizacion de una imagen
%% Entradas:
%% I - Imagen de entrada
%% tipo- 1 Binaria, 2 Gris
%% sigma - vector o valor de refencia (sigma1, sigma2)
%% condicion - 1-mayor o igual, 2-menor o igual
%% Salidas:
%% G - Imagen resultado
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ G ] = umbralizar( I, tipo, sigma, condicion )   
     bandIntervalo=false; 
     sigma1=sigma(1);
     if size(sigma,1)>1 %% es un intervalo
         sigma2=sigma(2);
         bandIntervalo=true;
     else  %% es una constante
         sigma2=0;
     end
     if (tipo==1) %% binario
        G=zeros(size(I,1),size(I,2));
     else  %% mismo tipo que la imagen de entrada
        G=zeros(size(I));
     end
     for i=1:size(I,1) %% renglones
         for j=1:size(I,2)
             valor=max(I(i,j,:));
             if (bandIntervalo)
                 if (condicion==1) %% dentro del interv
                     if ((valor>=sigma1)&&(valor<=sigma2))
                         if (tipo==1)%% binaria
                             G(i,j,:)=255;
                         else  %% gris
                             G(i,j,:)=I(i,j,:);
                         end                          
                     end
                 else  %% fuera del intervalo
                     if ((valor<=sigma1)||(valor>=sigma2))
                         if (tipo==1)%% binaria
                             G(i,j)=255;
                         else  %% gris
                             G(i,j,:)=I(i,j,:);
                         end                          
                     end                     
                 end
             else
                 if (condicion==1) %% mayor o igual
                     if (valor>=sigma1)
                         if (tipo==1)%% binaria
                             G(i,j,:)=255;
                         else  %% gris
                             G(i,j,:)=I(i,j,:);
                         end                                                  
                     end
                 else %% menor o igual
                     if (valor<=sigma1)
                         if (tipo==1)%% binaria
                             G(i,j)=255;
                         else  %% gris
                             G(i,j,:)=I(i,j,:);
                         end                                                  
                     end       
                 end
             end
         end
     end
     G=uint8(G);
end
