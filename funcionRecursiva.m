%% FUNCION RECURSIVA
%% Entradas
%%     IFondo - Imagen de Fondo
%%     K - Número de imagen
%%     PathIm - Directorio
%% Salida
%%     F - Fondo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ F ] = funcionRecursiva( PathIm, K, T )
    
    fn = sprintf('%s*.jpg',PathIm); 
    indexImages = dir(fn);
    IFondo = 0;
    IOriginal = 0;

    if(T == K)   
        IFondo = fondoUno(K, PathIm);
        F = IFondo;
        imwrite(F,['D:\Ing. de Software\Semestre 5\Procesamiento de Imagenes Secuencial\ProyectoUno\Salidas\IFondo',num2str(T),'.jpg']);
    else
        F = funcionRecursiva(PathIm, K, (T - 1));
        fn = sprintf('%s%s', PathIm, indexImages(T).name); 
        IActual = imread(fn); 
        FA = (F * ((K - 1) / K) + ((1 / K) * IActual));
        [IDif, valDif] = diferencia(IActual,FA);
        IDifUmb = umbralizar(IDif, 1, 0.20*valDif, 1);
        G = marcar(IDifUmb, IActual, FA);
        %imwrite(F,['D:\Ing. de Software\Semestre 5\Procesamiento de Imagenes Secuencial\ProyectoUno\Salidas\IFondo',num2str(T),'.jpg']);
        imwrite(G,['D:\Ing. de Software\Semestre 5\Procesamiento de Imagenes Secuencial\ProyectoUno\Salidas\IMarcada',num2str(T),'.jpg']);
    end;
    
end

