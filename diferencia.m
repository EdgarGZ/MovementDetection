%% DIFERENCIA ENTRE IMAGENES
%% Entradas
%% I1, I2 imagenes del mismo tamaño
%% Salidas
%% IDif - imagen de diferencias
%% maxDif - valor maximo de diferencia
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ IDif, maxDif ] = diferencia( I1, I2 )

    IDif = abs(double(I1) - double(I2));
    IDif = uint8(IDif);
    maxDif = max(IDif(:)); % maximo como vector con '(:)'
    
end

