clear all;
close all;
clc;

pathImages = 'D:\Ing. de Software\Semestre 5\Procesamiento de Imagenes Secuencial\Imagenes\';

tic; Fondo = funcionRecursiva(pathImages, 30, 200); toc;

pathSalidas = 'D:\Ing. de Software\Semestre 5\Procesamiento de Imagenes Secuencial\ProyectoUno\Salidas\';
aviName='D:\Ing. de Software\Semestre 5\Procesamiento de Imagenes Secuencial\ProyectoUno\Video_K30_T200_Th0p20.avi';
fn = sprintf('%s*.jpg', pathSalidas);
indexImages = dir(fn);
numImages = length(indexImages);

v = VideoWriter(aviName);
v.FrameRate = 25;
v.Quality = 80;
open(v);
figure;

for n=1:numImages   
    fn = sprintf('%s%s',pathSalidas,indexImages(n).name); 
    Iorig =imread(fn); 
    figure(1);
    image(Iorig);
    pause(0.01);
    F = getframe(1); % captura la imagen de la figura
    writeVideo(v,F); % integra el frame al video
end;


close(v);
disp('videoExamen1.avi guardado con éxito.');

