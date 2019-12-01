%% MARCAR UMBRALIZADO
%% Entradas
%%     IUmb - Imagen Umbralizada
%%     IOrig - Imagen Original
%%     IFondo - Imagen de Fondo
%% Salidas
%%     G -  Imagen marcada
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ G ] = marcar( IUmb, IOrig, IFondo )
    
    G = IFondo;
    for i=1:size(IOrig, 1)
        for j=1:size(IFondo, 2)
            if (IUmb(i, j) > 0)
                G(i, j, :) = [255, 0, 0]; %% rojo
            end;
        end;
    end;
    G = uint8(G);

end

