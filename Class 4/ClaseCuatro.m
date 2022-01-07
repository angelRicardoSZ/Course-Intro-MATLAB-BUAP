%% Clase cuatro 


% 1. Leer varios archivos (txt,tsv,csv o xlsx)
% 2. Limpiarlos y estructurarlos 
% 3. Aplicar operaciones de inter�s
% 4. Visualizaci�n
% 5. Almacenamiento de datos y gr�ficas de forma automatica en formato xlsx



% 1. 
% Se tiene 5 archivos con datos experimentales 

filename = "UV-Vis-";
for i=1:5
    FileLabel(i) = filename + num2str(i) + ".tsv"; % Crea el nombre de lso 5 archivos
end

Dat1 = lectura(FileLabel(1));       % Utiliza la funci�n Lectura
                                    % Para leer la informaci�n contenida 
                                    % en el primer archivo

% Es posible hacerlo de forma automatizada 
filename = "UV-Vis-";
for i=1:5
    FileLabel(i) = filename + num2str(i) + ".tsv";     % Creamos el nombre de archivos
    Dat = lectura(FileLabel(i));                       % Adquirimos la informaci�n
    DatosExp{i} = Dat;                                 % Almacena en una matriz de celdas
    Tam(i) = size(DatosExp{i},2);                      % Numero de elementos (columnas)
end

% 2. Limpieza y estructura

%DatosExp{1}{1}{1:2}
DatosExpP{1}=strrep(DatosExp{1}{1},',','.');    % Conversi�n de comas a puntos 

% Conversi�n de comas a puntos en ciclo for, para cada celda i, aplicado
% a cada elemento j
for i = 1:5
    for j = 1:Tam(i)
        DatosExpP{i}{j}=strrep(DatosExp{i}{j},',','.');    % Celda i, elemento j (vals.)
    end
end    

% Conversi�n de string a n�meros

for i = 1:5
    for j = 1:Tam(i)
        for k = 1:length(DatosExpP{i}{j})
            DatosExpD{i}{j}{k}=str2num(DatosExpP{i}{j}{k});                       % Conversi�n de char a decimales
        end
    end
end

DatosExpD{1}{1}{10};    % Regresa un vector con dos elementos
DatosExpD{1}{1}{10}(1); % Regresa el elemento 1 del vector 

%  Datos finales, por columna
S = sum(size(DatosExpD{2}{4}{11}));
for i = 1:5
    for j = 1:Tam(i)
        for k = 1:length(DatosExpP{i}{j})
            S = sum(size(DatosExpD{i}{j}{k}));
            if S == 3
                DatosCleanOne{i}{j}{k} = DatosExpD{i}{j}{k}(1);
                DatosCleanTwo{i}{j}{k} = DatosExpD{i}{j}{k}(2);
            end
        end
    end 
end
 
% Eliminando celdas vac�as
% A = cellfun(func,C)
% R(~cellfun('isempty',R))

for i = 1:5
    for j = 1:Tam(i)
    	DatosCleanOne{i}{j}=DatosCleanOne{i}{j}(~cellfun('isempty',DatosCleanOne{i}{j}));
    	DatosCleanTwo{i}{j}=DatosCleanTwo{i}{j}(~cellfun('isempty',DatosCleanTwo{i}{j}));
    end
end

% Conversi�n de datos a vectores para tratamiento, visualizaci�n y
for i = 1:5
    for j = 1:Tam(i)
        VarX{i}{j}=cell2mat(DatosCleanOne{i}{j});
        VarY{i}{j}=cell2mat(DatosCleanTwo{i}{j});
    end
end    
%% 4. Visualizaci�n
Exp="Exp";
for i = 1:5 
    FunNum = Exp + num2str(i);
    LabShort{i} = FunNum;  
    LabelsFigVar{i}= matlab.lang.makeValidName(FunNum);
    LabelsFigVar{i} = figure;
    for j= 1:Tam(i)
        FunNum2 = Exp + num2str(i)+ num2str(j);
        CellLab{i}{j} = FunNum2;
    end
end

for i= 1:5
    figure(LabelsFigVar{i})
    for j = 1:Tam(i)
        hold on;
        %LineProp = "-" + Colores{k};  
        plot(VarX{i}{j},VarY{i}{j});
        legend(CellLab{i}{1:j},'Location','southwest')
    end
end


%% 5.  Almacenamiento
for i = 1:5
    Label = LabShort{i} + ".xlsx";
    for j=1:Tam(i)
        M(:,1) = VarX{i}{j};
        M(:,2) = VarY{i}{j};
        T = array2table(M);
        T.Properties.VariableNames(1:2) = {'X','Y'};
        warning( 'off', 'MATLAB:xlswrite:AddSheet' );
        writetable(T,Label,'Sheet',j) % Sintaxis 
    end
end    
