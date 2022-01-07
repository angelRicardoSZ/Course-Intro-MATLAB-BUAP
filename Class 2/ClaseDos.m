%% --- Clase Dos ---

% Contenido
% 1.  Funciones
% 2.  Function Handle
% 3.  Cellfun
% 4.  Figuras

%% 1.  Funciones

 % Sintaxis
                            
function [y1,...,yN] = NombreFuncion(x1,...,xM)
    %operaciones
end

% El nombre del archivo debe ser el nombre de la función (una sola función)
% Usar la palabra end para indicar que es el final de la fución


% Ej. 1, función promedio average.m
function prom = average(vec)
    prom = sum(vec(:))/numel(vec)
end    

% Ej. 2, función con múltiples resultados
function [mean,std] = MEANySTD(v)
    n = length(v);
    mean = sum(v)/n;
    std = sqrt(sum((x-mean).^2/n));
end


%% Es posible usar funciones dentro del mismo script
x = 3;
y = 2;
z = perm(x,y)

function p = perm(n,r)
    p = fact(n)*fact(n-r);
end

function f = fact(n)
    f = prod(1:n);
end


% Es posible crear funciones dentro de mas funciones 
function b = myfunction(a)          % Función principal
   b = squareMe(a)+doubleMe(a);
end

function y = squareMe(x)            
   y = x.^2;
end

function y = doubleMe(x)            % Función local
   y = x.*2;
end


% Function Handle
    
    % Almacena una función
    % Es posible utilizarla en un script, siempre que 
    % se encuentre en el mismo directorio y
    % permite pasar una función a otra función
    
f = @NombreFuncion; % Sintaxis
                    % es necsario crear la función antes y
                    % guardarla como un archivo .m
%Ej. 1
function y = Cuadrado(x)
    y = x.^2;
end

f = @Cuadrado;
a = 4;
b = f(a)

% Ej. 2, función anónima
Nombrefuncion = @(argumentos) operaciones

f = @(p) p.^2;
y = f(3)

% Ej.3, calcular la intergal de una función
integral(f,0,1);

% Ej.4, vector de funciones handle
C = {@sin, @cos, @tan};
C{2}(pi)


%% 3. Cellfun

% Funciones aplicadas a las matrices de celdas
A = cellfun(func,C)     %   Aplica la función func, al contenido de cada celda 
                        %   de la matriz de celdas C
                        %   una celda a la vez, luego concatena los
                        %   resultados en un vector A
                        %  A(j) = func(C{i})
% Ej. 1                        
C = {1:11, [1;2; 31], []} % Calcular la media de cada vector
A = cellfun(@mean,C)

% Múltiples matrices de celdas
A = cellfun(func,C1,...,Cn);  % Aplica func a los contenidos de las celdas de C1,...,Cn de tal forma que
                              % A(j) = func(C1{j},...,Cn{j}) 
% Ej. 2                          
X = {5:5:100, 10:10:100, 20:20:100};
Y = {rand(1,20), rand(1,10), rand(1,5)};

figure
hold on
p = cellfun(@plot,X,Y);
p(1).Marker = 'o';
p(2).Marker = '+';
p(3).Marker = 's';
hold off

% Ej. 3 Obteniendo más de 1 vector de salida
C = {3:20, [2 3; 4 7; 6 0], []}
[renglones,columnas] = cellfun(@size,C)

% Creación de figuras 

figure(Name,Value)      % Crea una figura (ventana)
                        % 'Name', 'Color', 'Position','Units'
                        
% Ej. 1 

figure('Name','Datos Experimentales');

% Ej. 2 

figure('Name','Datos Experimentales','NumberTitle','off');

% Ej. 3 

f1 = figure;
f2 = figure;

figure(f2);                 % Elige a la figura actual como f2
plot([1 2 3],[2 4 6]);      
figure(f1);                 % Elige a la figura actual como f1
scatter((1:20),rand(1,20));
                                      
% Guardar figuras
saveas(fig,filename)        % fig -> figura
                            % filename ->  debe incluir la extensión
% Ej. 
saveas(f1,'Ej3.png')

% Ej. 4, función dentro de otra función

function p = HacerElipse(a,b)
p = @elipse;

   function y = elipse(x)
   y = b*sqrt(1-((x.^2)/(a.^2)));
   end

end

% Diferentes familias de curvas cambiando los parámetros de a,b

Elips1 = HacerElipse(1,2);
Elips2 = HacerElipse(1,3);

x= [-1,1];  

figure;                     %   Crea una figura
hold on;                    %   Mantiene los gráficos en la misma figura
fplot(Elips1,x);        %   fplot(función, intervalo)
fplot(Elips2,x,'r');
hold off

% Ej. 5, crear varias funciones mediante un ciclo
% Variando b
bVal = [2 3 4 5 6];
Fun = "Elips";
ArrayFun = cell(1,length(bVal));
CellLabel = cell(1,length(bVal));
for k = 1:length(bVal)
    FunNum = Fun + num2str(k);
    CellLabel{k} = FunNum;
    FunVar = matlab.lang.makeValidName(FunNum);
    FunVar = HacerElipse(1,bVal(k));
    ArrayFun{k} = FunVar;
end


% Ahora se muestran las gráficas
Colores = {'r','g','m','c','k'};
for k = 1:length(bVal)
    hold on;
    %LineProp = "-" + Colores{k};  
    fplot(ArrayFun{k},[-1,1]);
    legend(CellLabel{1:k},'Location','southwest')
end

% Ej. 6, Crear varias funciones mediante un ciclo dentro de otro ciclo
% Variando a y b 
aVal = [1 2 3 4];                       % Parámetro a con 4 valores
bVal = [2 3 4 5 6];                     % Parámetro b con 5 valores
Fun = "Elips";                          % Creamos un string 
rows = length(aVal);                    % Renglones
columns = length(bVal);                 % Columnas
                                        % Creamos la matriz de celdas para guardar:
ArrayFun = cell([rows columns]);        % las funciones
CellLabel = cell([rows columns]);       % los nombres 

for i = 1:rows
    for j= 1:columns
        FunNum = Fun + num2str(i)+ num2str(j);
        CellLabel{i,j} = FunNum;
        FunVar = matlab.lang.makeValidName(FunNum);
        FunVar = HacerElipse(aVal(i),bVal(j));
        ArrayFun{i,j} = FunVar;
    end
end

% Ahora se muestran las gráficas
% Colores = {'r','g','m','c','k'};
for i = 1:rows
    for j = 1:columns
        hold on;
        %LineProp = "-" + Colores{k};  
        fplot(ArrayFun{i,j},[-1,1]);
        legend(CellLabel{1:i,1:j},'Location','southwest')
    end
end


% Para comparar con el código del ejemplo 9, cuando a=1 y b cambia
for h=1:columns
    hold on;
    fplot(ArrayFun{1,h},[-1,1]);
    legend(CellLabel{1,1:h},'Location','southwest')
end


% 1ra Modificaciones del ejemplo 6
aVal = [1 2 3 4];
bVal = [2 3 4 5 6];
rows = length(aVal);
columns = length(bVal);
Values = cell([rows columns]);
for i=1:rows
    for j=1:columns
        Values{i,j} = [aVal(i) bVal(j)];    % Genera las combinaciones
    end
end    

Fun = "Elips";
ArrayFun = cell([rows columns]);
CellLabel = cell([rows columns]);

for k = 1:rows
    for j= 1:columns
        FunNum = Fun + num2str(k)+ num2str(j);
        CellLabel{k,j} = FunNum;
        FunVar = matlab.lang.makeValidName(FunNum);
        FunVar = HacerElipse(Values{k,j}(1),Values{k,j}(2));
        ArrayFun{k,j} = FunVar;
    end
end
% Ahora se muestran las gráficas
% Colores = {'r','g','m','c','k'};
rango = [-2,2];
for k = 1:rows
    for j = 1:columns
        hold on;
        %LineProp = "-" + Colores{k};  
        fplot(ArrayFun{k,j},rango);
        legend(CellLabel{1:k,1:j},'Location','southwest')
    end
end


% 2da modificacion del ejemplo 6, almacenamiento de datos en una celda

aVal = [1 2 3 4];
bVal = [2 3 4 5 6];
rows = length(aVal);
columns = length(bVal);

for i=1:rows
    for j=1:columns
        Values{i,j} = [aVal(i) bVal(j)];
    end
end    

Fun = "Elips";
Dim = rows*columns;
ArrayFun = cell([rows columns]);
CellLabel = cell([rows columns]);

for k = 1:rows
    for j= 1:columns
        FunNum = Fun + num2str(k)+ num2str(j);
        CellLabel{k,j} = FunNum;
        FunVar = matlab.lang.makeValidName(FunNum);
        FunVar = HacerElipse(Values{k,j}(1),Values{k,j}(2));
        ArrayFun{k,j} = FunVar;
        
    end
end
% Ahora se muestran las gráficas
% Colores = {'r','g','m','c','k'};
min=-1;
max=1;
step=0.01;
interval = min:step:max;

for k = 1:rows
    for j = 1:columns
        hold on;
        %LineProp = "-" + Colores{k};  
        fplot(ArrayFun{k,j},[-1,1]);
        Datos{k,j}=[feval(ArrayFun{k,j},interval)];
        legend(CellLabel{1:k,1:j},'Location','southwest')
    end
end


% Ej. 7, función de 3 variables
function p = HacerElipseDos(a,b,c)      % Se guarda como HacerElipseDos.m
p = @elipseDos;

   function y = elipseDos(x)
   y = (b*sqrt(1-((x.^2)/(a.^2))))+c;
   end
   
end

aVal = [1 2 3 4];
bVal = [2 3 4 5 6];
cVal = [1 2];
rows = length(aVal);
columns = length(bVal);
pag = length(cVal);
for i=1:rows
    for j=1:columns
        for k=1:pag
            Values{i,j,k} = [aVal(i) bVal(j) cVal(k)];
        end
    end
end    

Fun = "Elips";
ArrayFun = cell([rows columns pag]);
CellLabel = cell([rows columns pag]);

for i = 1:rows
    for j= 1:columns
        for k=1:pag
            FunNum = Fun + num2str(i)+ num2str(j)+num2str(k);
            CellLabel{i,j,k} = FunNum;
            FunVar = matlab.lang.makeValidName(FunNum);
            FunVar = HacerElipseDos(Values{i,j,k}(1),Values{i,j,k}(2),Values{i,j,k}(3));
            ArrayFun{i,j,k} = FunVar;
        end
    end
end
% Ahora se muestran las gráficas
% Colores = {'r','g','m','c','k'};
min=-1;
max=1;
step=0.01;
interval = min:step:max;

for i = 1:rows
    for j = 1:columns
        for k=1:pag
            hold on;
            %LineProp = "-" + Colores{k};  
            fplot(ArrayFun{i,j,k},[-1,1]);
            Datos{i,j,k}=[feval(ArrayFun{i,j,k},interval)];
            legend(CellLabel{1:i,1:j,1:k},'Location','southwest')
        end
    end
end

