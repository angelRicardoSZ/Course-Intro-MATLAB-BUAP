%% Programa que calcula el �rea de un circulo
clear all;clc
%  Declaraci�n de constantes
msj1 = 'Este programa calcula el �rea de un circulo\n';
msj2 = 'Por favor introduce el radio del circulo en metros: ';
msj3 = 'Realizando operaciones';
msj4 = '...';
%msj5 = 'El area en metros cuadrados es';
time = 2;   % Pausara el programa por 3 segundos
%  Bienvenida 
Fecha1 = datetime('now');
fprintf('Fecha de acceso: %s\n',Fecha1)
disp('-------')
%  Mostrando 1er mensaje
%disp(msj1)
fprintf(msj1)
%  Obtenci�n de radio
r = input(msj2);
a = pi*r^2;
disp(msj4)
pause(time);
disp(msj3);
pause(time);
disp(msj4)
fprintf('El �rea es A = %.3f metros cuadrados\n',a )
%%
