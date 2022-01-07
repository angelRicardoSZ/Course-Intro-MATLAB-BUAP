%% ---   Clase 1  ---
%  Fecha: 9 enero 2021
%  Actualizado. 15 enero 2021

%  Elaborado por: Angel Ricardo Sánchez Zeferino
%
%  Referencias
%
%  1. https://it.mathworks.com/help/pdf_doc/matlab/matlab_prog.pdf
%  2. Kiusalaas (2005) Numerical Methods in Engineering with MATLAB
%  3. http://fy.chalmers.se/~romeo/RRY025/getting_started/tutorial_on_logicals.pdf


%%  ---  Contenido  --- 

%   1. Comandos básicos
%   2. Clases de datos númericos
%   3. Operaciones básicas con números
%   4. Vectores y matrices
%   5. Operadores lógicos y codicionales
%   6. Ciclos 
%   7. Tablas 
%   8. Vector de celdas


%%  1. Comandos básicos

help func           %   Preguntar a Matlab como funcionan algunas funciones
clc                 %   Limpiar consola
clear all           %   Limpiar workspace
clear var           %   Elimna variables que yaa no se necesitan
;                   %   Evita mostrar los resultados de alguna operación 
whos var            %   Brinda información sobre la variable almacenada en el workspace
x = 1 + 3/2 - 5/6 + 7/8 ... % Continuación de comandos largos mediante ...
    - 1/3 + 9/8;


%%  2.  Clases de datos
                    %   Existen 16 tipos de clases en MATLAB, cada una de
                    %   estas clases se representa como una matriz o vector
                    %   excepto function handles, mostrar diagrama.
class()                    
%   2.1 Númericos
                    %   2.1.1 Enteros
                    
                    %   MATLAB tiene 4 clases de enteros con signo 
                    %   y 4 clases de enteros sin signo (Mostrar tabla)
        
int8(x)             %   Enteros con signo 8 bits (1 Byte)
int32(x)            %   32 bits (4 Byte)

uint8(x)            %   Entero sin signo 8 bits (1 byte)
uint32(x)           %   32 bits (4 Byte)

intmax('int8')      %   Máximo entero
inmin('int8')       %   Mínimo entero    
int8(1000)          %   Si sobrepasa el límite MATLAB lo almacena 
                    %   como el valor límite     
                    
int32(NaN)          %   NaN                  

                    %   MATLAB almacena cualquier número como double
                    %   por defecto
double()            %   se almacena en 
                    %   64 bits (8 Bytes)
x = 2;
whos 2
double(x);          %   Convierte el objeto X a un objeto de tipo flotante
  
realmax             %   Límite superior
realmin             %   Límite inferior

                    %   Números myores que realmx o menores que realmin 
                    %   son asignados con inf o -inf.
realmax + 1e+308;   %   1en = 10^n
single              %   32 bits (4 bytes), utiliza la mitad de la memoria empeada
                    %   para un objeto de tipo double, por lo tanto es más rápido 
z = single(12);
whos z
realmax('single')   %   Límite superior
realmin('single')   %   Límite inferior

                    %   Se aconseja emplear single para números que se
                    %   encuentran entre 3.4 x 10^38 y -3.4 x 10^38
                    %   debido a que requiere menos memoria 
                    %   (32 bits en lugar de 64 bits), sin embargo al
                    %   emplear single se tendrá menos precisión.
                    

                    %   Enteros y flotantes
                    %   Operaciones que involucran enteros y flotantes
                    %   siempre resultan en entero 
x = int64(32);      %   realiza la operación con punto decimal y redondea
x * 3.222;          %   para convertir a entero (> 0.5 0 < 0.5)
class(x)
                    %   Mientras que operciones entre enteros y enteros
                    %   resultan en enteros
                    
                    
x = int8(100) * 3;  %   Los límites mencionados también 
                    %   aplican en las operaciones 
                    
format style        %   Cambia el formato de salida (no las operaciones)
                    %   por el formato especificado por style
                    %   para regresar al formato por defecto (short)
                    %   solo escribir format
format long
pi                  
format 
                    %   Redondeo
x = 1 - 3*(4/3 - 1);

                    
                    %   Inf
1/0;                %   Operaciones que llevan a resultados
1e1000;             %   demasiado largos que no son posible representar como
exp(1000);          %   valores de punto flotante
log(0);          
                    %   En ocasiones se desea saber si una operación da
isinf()             %   como resultado infinito
                    
                    %   NaN  (Not a number)
                    %   Números que no son reales ni complejos
0/0;                %   Para saber si existe dicho valor
isnan(x)

    
%%  3. Operaciones básicas con números

+                           %   Suma
-                           %   Resta
*                           %   Producto
/                           %   División
^                           %   Potencia

m = mod(a,b)                %   regresa el residuo de la división de a/b
                            %   a -> dividendo, b -> divisor 
mod(10,2)                   %   = 0     
mod(3,2)                    %   = 1
mod(2.3444,2)               %   = 0.3444

idivide                     %   División entre enteros con opción de redondeo
idivide(int16(5),int16(2)) 

round(X,N)                  %   Redondea a N dígitos
% Si N > 0 entonces redondea a N dígitos a la derecha del punto decimal
% Si N < 0 entonces redondea a N dígitos a la izquierda del punto decimal
% Si N = 0 redondea al entero más cercano
round(2.345,2)              %   = 2.3500
round(2.345,1)              %   = 2.3000
round(2886.34558,-1)        %   = 2 890
round(2886.34558,-2)        %   = 2 900
round(2886.34558,-3)        %   = 3 000

                            %   Números complejos
                           
                            %   La raíz de -1 se representa mediante 
                            %   i o j
x = 10 + 3i;                %   Creación de un número complejo           
x = complex(10,3) 
                            %    Separación en parte real 
xRe = real(x)
xIm = imag(x)


% ---- Ejercicios sección 3 ----

    %   E.3.1 Escribe una secuencia de comandos que convierta la temperatura
    %   en Fahrenheit a grados Celsius y viceversa

    %  Resp. E.3.1   
centigrados   = 23;
f = (centigrados * 9/5) + 32;
%(farenheit - 32)*5/9
fprintf('Valor en F: %d\n', f);
       

%   4. Vectores y matrices

x = j:k;                    %   Crea un vector x con elementos [j,j+1,j+2,...,k]
x = [a1 a2 a3 ... an];      %   Otra forma de crear un vector 
x = [a1, a2, a3];           %   Otra forma de crear un vector 

x = j:i:k;                  %   Crea un vector x con elementos [j,j+i,j+2*i,...,k]
                            %   los elementos no son exactamente iguales  
v0 = 1:10;
v1 = 0:0.3:1;               %   Incremento de 0.3
v2 = 20:-3:0;               %   Decremento de 3 unidades

v3 = [1 2 3 4];

v = [a1 a2 a3 a4];          %   Vector renglón
v = [a1; a2; a3; a4];       %   Vector columna

                            %   Acceder elementos de vector 
x(i);                       %   Elemento i-esimo del vector x
x(1);                       %   Siempre inicia en uno el primer índice de un vector
x(end);                     %   último elemento del vector

                            %   Matrices
                            %   Siguen las reglas del álgebra lineal
                            
M0 = [1 2 3 4; 5 6 7 8; 9 10 11 12];
X=[1 2 3 4];                %   Creación mediante vectores
Y=[5 6 7 8];
Z=[9 10 11 12];
M0 = [X;Y;Z];

M2 = zeros(4,3);            %   4 renglones,3 columnas  llenas de ceros
M3 = ones(3,7);             %   3 renglones, 7 columnas llenas de unos
M4 = rand(6,3);             %   6 renglones, 3 columnas con números
                            %   aleatorios (único) entre 0 y 1 distribuidos
                            %   uniformemente
M5 = -9 + (9+9)*rand(10,1); %   Genera un vector columna de 10 renglones por una
                            %   columna, con números uniformemente distribuidos entre
                            %   el intervalo (-9,9)
                            %   r = a + (b-a).*rand(N,1).
M6 = randi([10,100],1,5);   %   generar 5 números aleatorios enteros entre 10 y 100
M7 = randi(10,5);           %   Genera una matriz de 5 x 5 enteros aleatorios entre 
                            %   1 y 10.
                  
M0(1,1);                    %   = 1, M(i,j), elementos del renglon i, columna j                   
M0(1,:);                    %   = 1 2 3 4  , todos los elementos del renglon 1
M0(:,1);                    %   = 1 5 9  , todos los elementos de la columna 1

                            %   Operaciones para Vector y Matriz          
x+a;                        %   Suma la cantidad a a cada elemento del vector x                 
x*a;                        %   Multiplica cada elemento de x por a
x/a;                        %   Divide cada elemento de x entre a
x./a;
x.^a;                       %   Eleva a la potencia a cada elemento del vector x
A = [1 1 1];
B = [1 2 3];
A + B;                      %   Suma cada elemento de A con cada elemento de B uno a uno. 

sqrt(x);                    %   Obtiene al raíz cuadrada de cada elemento del vector x
sin(x);                     %   Obtiene el seno de cada elemento de x, considerando su       
                            %   valor en radianes
M0';                        %   Transpuesta de M0        
transpose(M0);
x;                          %   Transpuesta de x (convierte a vector columna el vector fila)

A = [1 3;2 4];
B = [3 0;1 5];
A*B;                        %   Multiplcación de matrices
A.*B;                       %   Multiplicación de matrices por elemento uno a uno

M8 = [1 2 3; 4 5 6; 7 8 10];
M8*inv(M8);                 %   Calcula la matriz inversa de M8 y es multiplicada por M8

eye(n);                     %   crea una matriz identidad de n x n elementos
diag(x,k);                  %   coloca los elementos del vector x, en la diagonal 
                            %   principal si k=0, sup si k>0, inf si k<0.
                            %   así mismo devuelve la diagonal de interés
sort(A,dim,direction);      %   Dim es 1 columna, 2 renglon            
                            %   direction 'ascend' 'descend'
A = [9 0 -7 5 3 8 -10 4 2];
B = sort(A);

A = [3 6 5; 7 -2 4; 1 0 -9];
B = sort(A,2);

A = [10 -12 4 8; 6 -9 8 0; 2 3 11 -2; 1 1 9 3];
B = sort(A,'descend');
                            
M9  = [M8,M8];              %   Concatenación horizontal
M10 = [M8;M8];              %   Concatenación vertical

M11 = [1+2i, 2+3i; -i, 4j];

                            %  Inversa mediante método gaussiano
A=[11,12,310;21,22,320;310,320,330];
X=mdivideByGauss_(A,eye(3))

                            %  reshape
Y = reshape(X,m,n);         %  Regresa una matriz de elementos
                            %  m x n que son tomados de la matriz X, in
                            %  orden de las columnas. El número total de
                            %  elementos de X debe ser m x n.
a = 1:2:11;                 %  Ejemplo de Reshape
A = reshape(a,2,3);
 
                            %   Meshgrid
[X,Y] = meshgrid(x,y);      %   Devuelve coordenadas de una cuadricula 2-D
                            %   basadas en las coordenadas contenidas en
                            %   los vectores x y y
[X,Y] = meshgrid(x);        %   Devuelve coordenadas de una cuadricula cuadrada                         
  

                            %   Ver tabla de lista de comandos  

                            %   Input                             
x = input('Mensaje que aparecera al usuario')
                            %   Si el usuario pulsa la tecla Entrar,
                            %   entonces input devuelve una matriz vacía
                            %   Si el usuario introduce una expresión no
                            %   válida entonces aparece un mensaje de error
s = input('Mensaje','s')                            

                            %   Disp 
msj = 'Mensaje a mostrar';
disp(msj)                   %   Muestra el valor de una variable

                            %   fprintf
msj = 'Mensaje a mostrar %Conversión ';  % En donde se coloca % es donde
                                         % se presentara la variable
fprintf(msj,var);                        % var es la variable
a=0.0001234;
fprintf('%.7f\n',a)


%  --- Preguntas sección 4 ---

%  ¿Cómo se puede crear un vector

%  ¿Cómo se accede a los elementos de un vector y de una matriz?

%  ¿Cuál el el índice con que accedo al primer y último elemento de un vector?
                            
%  --- Ejercicios sección 4 ---
%  E.4.1 Desarrollar una serie de comandos que calculen el área de un circulo

%  E.4.2 Calcula el volumen de 3 cubos con diferentes longitudes de lado

%  E.4.3 Crea un vector renglón de 3 elementos cada uno con valor cero

%  E.4.4 Crea un vector columna con los números del 3 al 27 con paso de 3
%  unidades

%  E.4.5 Crea una matriz de 7(rows) X 8(columns) con elementos aleatorios
% entre 237 y 1000

%  E.4.6 Crea 2 una matrices identidad de 7X7, divide cada elemento entre 2 de la primera matriz, de la 
% segunda, multiplicalo por 4, suma las matrices elementos a elemento

%  E.4.7 Resuelve el sistema 

%  E.4.8 Genera la siguiente matriz mediante diag

%  E.4.9 Genera una matriz de 7 X 3 elementos aleatorios del 3 al 20 y
%  ordena por renglon en orden descendente

%  E.4.10 Genera tres vectores de 10 elementos, luego unirlos de tal forma
%  que generes una matriz de 10 renglones y 3 columnas, finalmente
%  convierte esta matriz a una matriz de 6 renglones por 5 columnas

% E.4.11 Genera un archivo .m, que pida los elementos de la matriz a y b 
%  en un sistema de ecuaciones de 3 x 3 como el visto en el ejercicio E.4.7
%  haz las operaciones y da a la salida el resultado


%% 5.  Operadores lógicos 

==                          %  Igual 
and                         %  &
o                           %  |
no                          %  ~
exp1 && exp2                %  && and short circuit:
                            %  se evaluara exp2 si exp1 es verdadera
exp1 || exp2                %  || or short circuit:
                            %  se evaluara exp2 si exp1 es falso
                            %  en caso contrario no se evaluara

                            %  IGUALDAD          
x1 = [1+2i 2 13 i 1.3-2i];  %  Igualdad de elementos de un vector
x2 = [2i 2 13 i 1.3];
x1 == x2;
eq(x1,x2);

                            %  Igualdad de elementos entre matrices
M1 = [1 2 3; 4 5 6; 7 8 10];
M2 = [0 2 9; 4 99 6; 7 100 10.0];
M1==M2;

VecChar = 'Texto';          % Igualdad de elementos
                            % entre un vector de caracteres
VecChar == 'T';

% Igualdad de elementos para una matriz de datos categóricos
VecCat = categorical({'Micro','Nano','Nano';'Micro','Nano','Micro'});
VecCat == 'Micro';
VecCat(1,:) == VecCat(2,:);

                            %  DESIGUALDAD
x1 = 11:20;
x2 = 1:3:28;
x1 > x2;                    %  Devuelve un vector lógico 
x1(x1>x2);                  %  Devuelve los elementos
                            %  que cumplen la condición
x2(x1>x2);
                            %  Comparación con vector
                            %  de números complejos
x = [1+2i 3-4i 8+3i]; 
x(x>2);                     %  Solo compara la parte real
x(imag(x)>2);               %  Compara la parte imaginaria
x(abs(x)>2); 

x = [1+2i 3-4i 1+3i];       %  Buscar que elemento al menos una parte (real o imaginaria)
                            %  es mayor que 2

M1 = [1 2 3; 4 5 6; 7 8 10];
M2 = [0 2 9; 4 99 6; 7 100 10.0];
M1 > M2;
M1 > 10;
M2 > 10;
M2(M2 > 10);

                            %  Reemplazar valores
                            %  que cumplen una condición
M2(M2 > 10) = 0;

rng default;                %  Generador de números aleatorios
A = randi(15,5);            %  Genera una matriz de 5x5 números 
                            %  aleatorios entre el 1 al 15
                            
                            %  FIND
find(A<9);                  %  Devuelve el índice del elemnto
                            %  que cumple la condición
A(A~=10) = NaN;             %  Sustituye por NaN los valores que son dif. a 10
A(isnan(A)) = 0;            %  Pregunta los elementos que son NaN y los sustituye por 0

                            %  Comparación con fechas del tiempo
VecTiempo = datetime([2020,1,11;2020,05,31]);
VecTiempo(VecTiempo> '2020-01-13');

                            %  AND
&

M1 = [1 4 0; 10 9 22; 1 0 0];
M2 = [33 35 1; 11 0 0; 22 0 0];
M1 & M2;                    %  Asigna el valor 1 si M1 y M2
                            %  tienen elemento diferente de cero 
    
                            % OR
M1 = [10 89 32; 0 78 99; 100 0 12];
M2 = [22 99 89; 33 0 0; 99 0 12];

M1 | M2;                    %  Cero si ambos elementos tiene cero

                        %  Reducción de arreglos lógicos 
                        %  Las funciones any y all son extensiones 
                        %  de los operadores lógicos o y and 
                        %  En lugar de comparar dos elementos, las funciones any y
                        %  all comparan todos los elementos en una dimensión
                        %  particular. Es como tener todos los elementos
                        %  estuvieran conectados mediante los operadores & o | 
rng default;
A = randi(25,5)         %  Creamos una matriz de números aleatorios entre 1 y 25, con 
                        %  dimensión de 5 X 5. 
A =~mod(A,2)            %  Ahora encontramos los números pares
A(:)                    %  Convierte la matriz en un vector 
any(A(:))               %  Encontrar si existe algun número par (1)         
all(~A(:))              %  Pregunta si todos los elementos son impares

                             %  &&
b = 1;
a = 20;
x = (b ~= 0) && (a/b > 18.5)

                            %   Ejemplo con meshgrid y operadores
                            %   Ref 3
N=512;                      %   Especificar cuantos elementos se requieren
x=-N/2:1:N/2;               %   Crear un vector de -N/2 a N/2
Mx=meshgrid(x);             %   Creamos una matriz con cada coordenada x 
My=Mx';                     %   Lo mismo con el vector y (x')    
R=sqrt(Mx.^2+My.^2);        %   Asignamos un valor a cada pixel 
filtro=(Mx>0 & R>100);      %   Creamos un filtro
imshow(filtro)              %   Mostramos el resultado de aplicar el filtro
                             
                            %   Lo mismo que el ejemplo anterior    
N=512;                  
x=-N/2:1:N/2;               
y=-N/2:1:N/2; 
[Mx,My]=meshgrid(x,y);
R=sqrt(Mx.^2+My.^2);
filtro=(Mx>0 & R>100);
imshow(filtro)        

% Cambiando signo en y
N=512;                  
x=-N/2:1:N/2;               
y=N/2:-1:-N/2; 
[Mx,My]=meshgrid(x,y);
R=sqrt(Mx.^2+My.^2);
filtro=(Mx>0 & R>100);
imshow(filtro) 

% Disminuyando memoria en uso
Fecha1 = datetime('now');
N = single(512);
x = -N/2:1:N/2;               
y = N/2:-1:-N/2; 
[Mx,My]=meshgrid(x,y);
R=sqrt(Mx.^2+My.^2);
filtro=(Mx>0 & R>100);
imshow(filtro)
Fecha2 = datetime('now');
Diferencia1 = between(Fecha1,Fecha2);

clear N Fecha1 Fecha2 x y R Mx My filtro

Fecha1 = datetime('now');
N=5120;                  
x=-N/2:1:N/2;               
y=N/2:-1:-N/2; 
[Mx,My]=meshgrid(x,y);
R=sqrt(Mx.^2+My.^2);
filtro=(Mx>0 & R>100);
imshow(filtro) 
Fecha2 = datetime('now');
Diferencia2 = between(Fecha1,Fecha2);




%   Condicionales

%  If 
%  elseif
%  else
%  Switch

                            %   If 
                            %   if condición    despues de escribir 
                            %   las condiciones se aplica enter
                            %      Operaciones             
                            %   end             if y end deben ir sobre la misma columna de escritura

if rem(x, 2) == 0           %   Si el sobrante de la división entre 2 es cero
    disp('x es par')        %   entonces mostrara que x es par
    b = x/2;                %   y se realizara la operación
end

                            %   elseif, else
                            %   Cuando hay más opciones

x= randi(100, 1);           %   Devuelve un entero entre 1 y 100
if x < 30
    disp('pequeño')
elseif x < 80
    disp('mediano')
else 
    disp('grande')
end

                            %  switch
                            %  Cuando hay muchas comparaciones 
                            %  Recomendable cuando 
                            %  se necesitan comparar
                            %  valores discretos

[dayNum, dayString] = weekday(date, 'long', 'en_US'); % Regresa el dia de la semana en número y el 
                                                      % nombre del día de
                                                      % la semana

switch dayString
    case 'Monday'
        disp('Inicio de la semana')
    case 'Tuesday'
        disp('Día 2')
    case 'Wednesday'
        disp('Día 3')
    case 'Thursday'
        disp('Día 4')
    case 'Friday'
        disp('Ultimo día de trabajo')
    otherwise
        disp('Fin de semana!')
end

            %   Ver tabla presentación
 
%   --- Ejercicios Sección 5 ---

%   E.5.1 Representa alguna de las imagenes de la ref 3 mediante el uso de meshgrid,
%   condiconales, y imshow.

%   Resp 
%   Para el primer ejercicio se observa que esta soliciando las mismas
%   posiciones del ejemplo mostrado y ademàs las posiciones tales que x<0 y
%   R < 100, entonces tenemos las siguientes condiciones
cond1 = (Mx > 0 & R > 100);
cond2 = (Mx <= 0 & R <100);
filtro2 = (cond1 | cond2);
imshow(filtro2)

%   Para el segundo ejercicio se observa que la componente x debe ser
%   positiva y R>100, mientras que además existe otra condición, que es que R < 100
%   y My < 0, tener en cuenta que el indice de y va desde el más pequeño en
%   la parte superior hasta el más grande en la parte inferior
cond3 = (Mx > 0 & R > 100);
cond4 = (My >= 0 & R <100);
filtro3 = (cond3 | cond4);
imshow(filtro3)

%   En la siguiente figura, se ve que debe hacerse que Mx, My > 0 y Mx, My < 0
cond5 = (Mx > 0 & My > 0);
cond6 = (Mx < 0 & My < 0);
filtro4 = (cond5 | cond6);
imshow(filtro4)

%  En la siguiente figura se obsera que la condicion es un un radio 
%  grande y ademas que se cumple lo del ejemplo anterior
cond7 = (Mx > 0 & My > 0);
cond8 = (Mx < 0 & My < 0);
cond9 = (R <= R(512/2,end));
filtro5 = (cond7 | cond8 | cond9);
imshow(filtro5)

%  En la siguiente figura se observa que es la misma condición del ejemplo
%  en este caso deseamos los que sean mayores al readio del criculo, pero
%  que tengan My negativa, ademas queremos los que esten dentro del circulo
%  pero que tengan la componente My positiva
cond10 = (R <= R(512/2,end));
cond11 = ((My < 0) & (~cond10)) ;
cond12 =  ((cond10 ) & (My > 0));
filtro6 = cond11 | cond12;
imshow(filtro6)

%  Todos los que esten fuera del circulo y tengan la componente Mx POSITIVA
cond13 = (R <= R(512/2,end));
filtro7 = ((Mx > 0) & (~cond10)) ;
imshow(filtro7)



subplot(2, 3, 1)
imshow(filtro2)

subplot(2, 3, 2)
imshow(filtro3)


subplot(2, 3, 3)
imshow(filtro4)

subplot(2, 3, 4)
imshow(filtro5)

subplot(2, 3, 5)
imshow(filtro6)

subplot(2, 3, 6)
imshow(filtro7)





%%  6. Ciclos 
% for
% while
% continue
% break

% Explicar diagrama 

% for
for range(a,b)
    intrucciones
    for range(1,2)
        instrucciones
        
    end     
end

   

% creamos un vector de valores
% iteramos sobre cada elemento 
% para cada elemento imprimimos su valor
for x = 1:10 
   disp(x)
end

for x2 = [1 8 99 100]
    disp(x2)
end



% while, se repite siempre que la condición se mantenga verdadera
while condiciones
    instricciones
end


% Factorial empleando while
n = 5;
tot = n;
while n > 1
    n = n-1;
    tot = tot*n;
end
tot
% disp(['n! = ' num2str(tot)])
   
% 
n = 1;
nFactorial = 1;
while nFactorial < 1e100
    n = n + 1;
    nFactorial = nFactorial * n;
end


% 
x = 20;
limit = 30;
while x < limit
    fprintf('Valor de x: %d\n', x)
    x = x + 1;
end



%% Ej. 3  
i = 0;
sum = 0;
limit = 10;
while i < limit
    i = i + 1;
    sum = sum + (1/sqrt(i));
end
NumTerm = i;
SumTot = sum;

disp([' Se utilizaron ',num2str(NumTerm),' términos dando como resultado un valor de = ',num2str(SumTot)])

% https://lo.unisa.edu.au/mod/book/view.php?id=466690&chapterid=75069


% Break 
            % Interrumpe la ejecución de un ciclo for o while
            % las instrucciones que se encuentran posteriores al
            % break ya no se ejecutaran
% Ej. 1
% Desarrollar una suma de números aleatorios hasta que el siguiente
% número sea mayor que un límite superior
limit = 0.95;
x = 0;

while 1               % Permite la ejecución sin límite del contenido del ciclo
    nrand = rand      % Crea un número pseudoaleatorio en el intervalo (0,1)
    if nrand > limit  % Compara, si el número es mayor que limit, se 
        break         % detiene el ciclo while mediante el break
    end
    x = x +1;         % En caso contrario incrementa en 1 el valor de x y continua
end 


% Así mismo puedes saltar a la siguiente iteración del loop usando el
% comando continue
fid = fopen('magic.m','r'); % Abre el archivo
n = 0;                  % inica en cero el contador
while ~feof(fid)
    line = fgetl(fid);
    if isempty(line)
        break
    elseif ~strncmp(line,'%',1) % compara los caracteres
        continue                % En caso de que sea un comentario ignora
    end                         % lo que esta despues de continue y regresa al inicio del ciclo
    n = n + 1;
end
fprintf('%d lines in MAGIC help\n',n);
fclose(fid);



% Cuando por error se crea un ciclo infinito presionar ctrl + c en la
% consola

% Ciclos en Matrices

M = zeros(3,4)
for row = 1:size(M,1)
    for column = 1:size(M,2)
        M(row,column) = row+column;
    end
end    

Mren = 5;
Mcol = 2;

M = zeros(Mren,Mcol)
for row = 1:size(M,1)
    for column = 1:size(M,2)
        M(row,column) = row*pi;
    end
end 

% Arreglos  Multidimensional (Mostrar diagrama)
M1 = [10 12 44; 456 89 100; 1000 134 45];
M1(:,:,2) = [45 8899 3; 23 90 100; 1 0 2];
M4= [122 34 56; 12 34 11; 0 34 98];
M2 = cat(3,M1,M4);
% es posible asignar un mismo valor a todos los elementos de una matriz
% mediante
Matriz(:,:,:,:)=Valor

% Ciclo en un arreglo multidimensional

Mren = 5;
Mcol = 4;
Mpag = 3;
M = zeros(Mren,Mcol,Mpag);

for pag = 1:size(M,3)
    for row = 1:size(M,1)
        for col = 1:size(M,2)
            M(row,col,pag) = row+col+pag;
        end
    end 
end

% Acceder a determinadas columnas no continuas
M(:,[2 4],:)
% Acceder a columnas continuas
M(:,2:4,:)

% Función Permute, reordena las dimensiones de un arreglo multidimensional
                % en el orden que especifica por el vector
                % 
                [1 2 3 ]
permute(M,[2 1 3]) % Permute(M,[1d  2d 3d]) 

% Tambien es posible usar reshape
A = [1 2 3 4 5; 9 0 6 3 7; 8 1 5 0 2];
A(:,:,2) = [9 7 8 5 2; 3 5 8 5 1; 6 9 4 3 3];
B = reshape(A,[6 5])
   
% Ejercicios

% E.6.1.  Crea un programa que calcule los multiplos de 5 del 1 al 50

% E.6.2. Crear un programa que calcule el número máximo en un vector

% E.6.3. Crear un programa que dada una inversión p = 1000, calcule el número de 
% años que tardara en crecer a 6% anual hasta $ 10,000.00

%  E.6.4 Genera un archivo .m, que pida los elementos de la matriz a y b 
%  en un sistema de ecuaciones de 3 x 3 como el visto en el ejercicio E.4.7
%  haz las operaciones y da a la salida el resultado. Agrega una condición
%  que permita saber si la matriz tiene inversa, en caso contrario terminar
%  el programa

%  E.6.5 Modifica el E.6.1. para que pueda calcular que números son
%  divisibles desde el 2 hasta el 9
%  Resp en:
%  https://www.javatpoint.com/matlab-continue


%  E.6.6 Desarrolla un algoritmo que ordene los elementos de un vector de
%  una dimensión.
%  Resp en:
%  https://thilinasameera.wordpress.com/2011/06/01/sorting-algorithms-sample-codes-on-java-c-and-matlab/

%  E.6.7 Antes de ejecutar el siguiente código 
%   describe que sucedera
x = 3
k = 1
format long
while x ~= sqrt(1+x^2)
    x = sqrt(1+x^2);
    k = k+1;
end

% Ans. 1
for n = 1:50
    if mod(n,5)
        continue
    end
    disp(['Divisible by 5: ' num2str(n)])
end




% Ans. 2
mx=a(1);
for p=2:numel(a)
  if a(p)>mx
   mx=a(p);
  end
end



% Ans 3
p = 1000;
k=0;
while p < 10000
    p = (1.06)*p;
    k=k+1;
end


% Ans 4 
% program to find number which is divisible by all numbers from 2 to 9  
v = [2,3,4,5,6,7,8,9];  
min = 1;  
max = 10000;  
    for m = min : max  
        if mod(m,v(1))  
            continue  
        else  
            if mod(m,v(2))  
                  
                continue  
            else  
                if mod(m,v(3))  
                    continue  
                else   
                    if mod(m,v(4))  
                        continue  
                    else  
                        if mod(m,v(5))  
                            continue  
                        else  
                            if mod(m,v(6))  
                                continue  
                            else  
                                if mod(m,v(7))  
                                    continue  
                                else  
                                    if mod(m,v(8))  
                                        continue  
                                    else  
                                        disp(['divisible by all :' num2str(m)])  
                                          
                                    end  
                                end  
                            end  
                        end  
                    end  
                      
                end  
            end  
        end  
                 
    end    
    disp('....')  

  

%% 5.Matriz de celdas

% una vector de celdas (Cell array) es un tipo de dato con contenedores de 
% datos indexados llamados celdas, cada celda contiene cualquier tipo de
% dato, se accede a un conjunto de celdas mediante (), mientras que  para
% obtener el contenido de cada celda se usa {}.
% Ej. 1
C = {3,4,5;
     'text',rand(5,10,2),{11; 22; 33}}
 
C = {3,4,[5 8];
     'text',rand(5,10,2),{11; 22; 33}} 
 
C(1:2,3)             %  Celdas de renglón del 1 al 2, en la columna 3.
C{1:2,3}             %  Contenido de las celdas del renglón del 1 al 2, en la columna 3.
C{2,3}{2,1}          %  Contenido de las celdas del renglón 2, en la columna 3, 
                     %  accediendo al elemento del renglón 2 de la columna 1 de la
                     %  celda
C{2,2}(1,1,1)        %  Contenido del renglón 2, columna 2. Esta celda contiene una matriz 
                     %  multidimensional de 3 dimensiones, para acceder a los
                     %  elementos de la matriz se hace referencia a 3 índices
       
% Ej. 2
C = {'2018-08-01',[23 45 44 100 ]};
  
C(2,:) = {'2018-08-07',[21 331 231]};
C(3,:) = {'2018-08-08',[3.1 10 199]};

C(1,:)               %  Acceder a primer renglón y todas las columnas
C{1,:}               %  Acceder al contenido del primer renglón y todas las columnas

% Es conveniente crear primero 
% la matriz con celdas vacías y posteriormente llenar las celdas, esto
% permite una mayor rapidez de cómputo. Para ello se utiliza la función
% cell() 
cell(3)              %  cell(n) regresa una matriz de n X n celdas vacías
cell(2,3)            %  cell(n,m) regresa una matriz de n X m celdas vacías
cell(2,3,2)              
              
% Funciones para celdas
cell2mat             %  (mostrar imagen) Convierte un vector de celdas a un vector ordinario
                     %  del tipo de datos subyacente
                     %  Los elementos del vector de celdas debe contener el mismo
                     %  tipo de datos. Los contenidos de la celda deben permitir la
                     %  concatenación de las celdas
C = {2,    [4 10 22];
     [21; 33], [25 10 21; 23 45 99]};
A = cell2mat(C)



%% 5. Tablas
                            %   Tabla es un tipo de dato adecuado 
                            %   para ordenar información mediante
                            %   columnas y renglones con diferentes
                            %   tipos de objetos ( mostrar diagrama)
                              

% Creación 
T = table(var1,...,varN); 
    
Apellido = {'Reyes';'Aguilar';'Sanchez';'Diaz';'Gomez'};
Edad = [12;23;48;41;18];
Fumador = logical([0;0;1;0;1]);
Altura = [71;70;100;27;64];
Peso = [176;163;131;133;119];
Presion = [124 93; 109 77; 125 83; 117 75; 122 80];

T =table(Apellido,Edad,Fumador,Altura,Peso,Presion);

% Acceder a una columna 
T.Var

T.Apellido
T.Presion(1,2)
mean(T.Peso)

% Agregar una nueva columna mediante operaciones en las demás columnas 
T.BMI = (T.Peso*0.453592)./(T.Altura*0.0254).^2

% Propiedades
T.Properties.VariableNames
T.Properties.RowNames = Var

T({'Reyes','Sanchez'},:)

% Especificando las características de la tabla antes de cargar los datos
s = [2 3];  % Dos renglones por 3 columnas
TipoVar = {'double','datetime','string'};
T = table('Size',s,'VariableTypes',TipoVar);


% cell2table
C = {22 'sopa' 110 'C+'; 16 'pizza' 140 'B';...
    23 'arroz' 367 'A'; 12 'galletas' 160 'D'}

T = cell2table(C,...
    'VariableNames',{'Edad' 'Comida_Favorita' 'Calorias' 'Grado_Nutricional'})

% Crear una tabla, en la que los encabezados de la tabla se obtengan de la
% matriz de celdas

Pacientes = {'Genero' 'Edad' 'Altura' 'Peso' 'Fuma';...
    'M' 28 71 176 false;...
    'M' 34 69 163 true;...
    'M' 90 64 131 false;...
    'F' 12 64 131 true;...
    'F' 89 67 133 false;...
    'F' 76 64 119 false}

%  Exlcuimos el renglón de los nombres de las variables
Pacientes(2:end,:);     % se debe poner end, para que lea hasta el último renglón
T = cell2table(Pacientes(2:end,:)); % Aplicamos cell2table
T.Properties.VariableNames = Pacientes(1,:); 






    
%   2.2  Vectores de caracteres (character) y de cadenas (strings) 
                   
                    %   Existen dos formas de alamcenar texto en MATLAB 
                    %   ya sea en un string array (2016b en adelante)
                    %   o bien en un character array
                    %   esta última es válida en cualquier versión de 
                    %   MATLAB
                    
%   2.2.1 Character array

char   = 'Texto Vector de Caracteres';  %   Almacena como si fuera un vector   
whos char
                    %   Permite especificar nombres de archivos y etiquetas en gráficos
                    %   Permite el acceso a cada elemento dentro del vector
DNA = 'GCTAGAATCC'; %   Creación de vector de caracteres
Dna(1:2)            %   Los índices inician en 1

DNA2 = 'ATTAGAAACC';%   Es posible unir dos vectores de caracteres 
DNA3 = [DNA DNA2];  %   como se concaqueten dos vectores.
                    %   Desde la versión 2019a en adelante se recomienda 
                    %   append

%   2.2.2 String arrays

                    %   Nombres de archivos, etiquetas en gráficos, etc.

string = "Texto cadena de caracteres"; %    Creación de la cadena de caracteres   
strlength(string)                      %  = 12 contando los espacios

temp = "La temperatura es de ";        %    Creación de la cadena de caracteres
grad = "23°C";                         %    Creación de la cadena de caracteres
result = temp + gradient;              %    Concatena las cadenas

strList = ["Mercurio","Venus","Tierra"];  %  Creción de un vector con cadenas de caracteres
strlength(strList)                     % = 8     5     6

xnum = [5 10 20 30 3.222];             %    Vector con entradas númericas
xstr = string(xnum);                   %    Vector con entradas de tipo 
                                       %    cadena de caracteres

DiaHoy = datetime('Now');              %    Fecha de hoy
DiaHoy = string(DiaHoy);               %    Conversión a cadena de
                                       %    caracteres
                                       
                                       %    Conversión entre char y double
X = str2num('340');                    %    Vector de caracteres a números 
X = str2num('100 200 300 400');        %    Conversión entre cada elemento del vector 
X = str2num('100 200 300    400');

X = str2num('12e-3 5.9e-3 -8.1e-3 2.56e-3; 5 11.2 17.9 33'); % Es posible interpretar 
                                                             % notación
                                                             % exponencial

X = str2num('false true true false'); % Convertir a un array lógico                                                             
                                                                            
                            %   Convertir elementos de una matriz
A = [77 65 84 76 65 66];    %   Lo interpreta con código ASCII
C = char(A)                 %   dando resultado la palabra = Matlab
                            %   En general MATLAB almacena todos los
                            %   carácteres como cáracteres Unicode usando 
                            %   la codificación UTF-16
                            %   en esta codificación los primeros 128 simbolos  
                            %   incorporan la codificación ASCII)
                              
A = "String";               %   Conversión string a vector de carácteres
Avec = char(A)              %   Necesario para hacer uso de str2num
A = "1";           
str2num(A);
                            %   Conversión de vector de carácteres a string
chr = 'marte'
str = convertCharsToStrings(chr)
                            %   Vectores de caracteres dentro de arreglos de
                            %   cadenas de caracteres
str = ["Mercurio", "Marte", "Venus";
    "Tierra", "Jupiter", "Saturno"];
chr = str{2,2};
chr(1:3);
                            %   Reemplazando caracteres

str2 = ["Gemini","Apollo";
     "Skylab","Skylab B"];
chr2 = str2{2,2};                            
TF = isspace(chr2);         %   Encuentra los espacios en blanco en un 
                            %   vector de caracteres 
chr2(TF) = "-";             %   Sustituir el espacio por un guión
                            
replace(chr2," ","-");      %   Algo similar es posible usando replace 

%  Limpieza de vectores de caracteres

sonnets = fileread('sonnets.txt');  % Lectura de archio en formato txt
sonnets(1:35)               %   Mostrando los primeros 35 caracteres
sonnets = string(sonnets);  %   convierte a un vector de strings 

sonnets = splitlines(sonnets); %  Divide de acuerdo al caracter de nueva línea
sonnets(1:5)                %   Es un vector que contiene cadenas de caracteres

index = sonnets == "";      %   Busca los elementos que contienen cero carcteres ""
sonnets(index) = [];        %   Elimina los elementos que cumplen con la condición anterior

char = [".","?","!",",",";",":"];    %   Caracteres a reemplazar
sonnets = replace(sonnets,char," "); %   reemplazar por un espacio
sonnets(1:10)                 

sonnets = strip(sonnets);   %   Retira los espacios consecutivos en blanco iniciales
sonnets(1:10)

sonnetW = strings(0);      %  Crea un vector que contiene una cadena de caracteres vacía
for i = 1:length(sonnets)   %  Para cada elemento (renglon) en el vector sonnets
    sonnetW = [sonnetW ; split(sonnets(i))]; % divide el renglon de acuerdo a donde encuentre un espacio (split)
end
sonnetW(1:10)

%  Realiza un conteo de las palabras distintas
sonnetW = lower(sonnetW);          %  Primero convierte en minuscula
[words,~,idx] =  unique(sonnetW);     %  Devuelve las palabras únicas
numOccurrences = histcounts(idx,numel(words));  % Numel devuelve el número de elementos en un vector                          
                                                % histcounts divide en intervalos 
                                                % en este caso el indicado por numel    
%  Acomoda de la palabra más ocurrente a la menos
[rankOfOccurrences,rankIndex] = sort(numOccurrences,'descend');
wordsByFrequency = words(rankIndex);

%  Visualización
loglog(rankOfOccurrences);
xlabel('Rank of word (most to least common)');
ylabel('Number of Occurrences');

%   2.3 Fechas y horas

datetime                    %   Fecha y hora actual
t = datetime(2020,12,1);    %   Crear
t = datetime(DateStrings);  %   Convierte vector de caracteres a datetime
datetime('24-Oct-2014 12:45:07')

t = datetime(DateVectors);  %   Convierte un vector a datatime
datetime([2014 10 24 12 45 07]) %  24-Oct-2014 12:45:07
year(datetime([2014 10 24 12 45 07])) % Extrae el año de la fecha
                            %   Diferencias
Fecha1 = datetime('now');
Fecha2 = datetime('tomorrow');
Diferencia = between(Fecha1,Fecha2);

                            %   Generar secuencia de fechas
Fecha1 = datetime(2013,11,1,8,0,0);
Fecha2 = datetime(2013,11,10,8,0,0);
ListaFechas = Fecha1:Fecha2;
                            %   Incrementos especificos
ListaFechas2 = Fecha1:caldays(2):Fecha2;   % Cada 2 dias
ListaFechas3 = Fecha1:hours(2):Fecha2;     % Cada 3 horas

%   2.4 Categóricos 
categorical                 %   Tipo de dato empleado para almacenar datos con 
                            %   valores provenientes de un conjunto de categorias discretas
Estaciones = {'Estacion1';'Estacion2';'Estacion1';'Estacion3';'Estacion2'};
EstacionesCateg = categorical(Estaciones);
categories(EstacionesCateg)

%  --- Preguntas sección 2 ---

% P.2.1 Como puede ser guardado un string y un char?

% P.2.2 Cual es la diferencia entre un string y un char?

% P.2.3 Bajo que criterio se transforman los caracteres a números en MATLAB

% P.2.4 Menciona los bits y bytes empleados en el almacen de números de
% tipo entero y de tipo flotante, asi como sus valores límites y máximos y
% los decimales empleados que se utilizan en el caso del tipo flotante

% P.2.5 Menciona las ventajas de los enteros sin signo, por ejemplo en
% cuanto aumenta el rango de valores permitidos al quitar el signo al
% número

% P.2.6 Menciona en que casos parece un inf o un NaN

% ¿Cómo se almacenan los objetos de las 16 clases existentes en MATLAB?

%  --- Ejercicios sección 2 ---

% E.2.1 Crea tu nombre como un vector de caracteres y concatenalo de forma
% que haya espacio entre tus nombres y apellidos

% E.2.2 Crea un vector que contenga cadenas de caracteres, de tal forma que
% contenga diferentes caracteres, por ejemplo "," "?" "¡" etc, luego
% reemplazalos con espacios en blanco

% E.2.3 Crea un archivo tipo txt que este separado por comas, luego declara
% una serie de instrucciones para que MATLAB lea el archivo y lo separe
% cada vez que vea la coma como en el ejemplo visto en clase. 
%  Usar

% E.2.4 Crea la fecha del 3 de marzo de 2020 con hora 5:30 y crea la fecha
% de hoy a la hora de este momento, haz una resta de dichas fechas, una
% secuencia de fechas entre dichas fechas cada 20 dias

% E.2.5 Crea la fecha del 5 de enero de 2021, a las 3 pm y del dia de hoy a
% las 3 pm, crea una lista de fechas entre esos dos dias, de tal forma que
% cada intervalo de tiempo sea de 5 horas









