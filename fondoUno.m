%% FONDO
%% Entradas 
%%     K - Número promedio de imagenes
%%     PathIm - Directorio
%% Salida
%%     IFondo - Fondo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ IFondo ] = fondoUno( K, PathIm )
    
    fn = sprintf('%s*.jpg',PathIm); 
    indexImages = dir(fn);
    IFondo = 0;
    
    for i=1:K
        fn = sprintf('%s%s', PathIm, indexImages(i).name); 
        IOriginal = imread(fn); 

        if(i == 1)
            IFondo = double(IOriginal);
        else
            IFondo = IFondo + double(IOriginal);
        end;
    end;
    
    IFondo = uint8(round(IFondo/K));

end

