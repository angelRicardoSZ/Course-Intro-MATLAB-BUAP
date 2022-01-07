%%  1. Lectura
%   Acceder a los nombres de los archivos con terminación tsv
files=dir('*.tsv');
FilesName=string({files.name});
NF = length(FilesName);

for i=1:NF
    Dat = lectura(FilesName(i));                       % Adquirimos la información
    DatosExp{i} = Dat;                                 % Almacena en una matriz de celdas
    Tam(i) = size(DatosExp{i},2);                      % Numero de elementos (columnas)
end
%% 2. Limpieza y estructura
% Conversión de comas a puntos en ciclo for, para cada celda i, aplicado
% a cada elemento j
for i = 1:NF
    for j = 1:Tam(i)
        DatosExpP{i}{j}=strrep(DatosExp{i}{j},',','.');    % Celda i, elemento j (vals.)
    end
end
% Conversión de string a números
for i = 1:NF
    for j = 1:Tam(i)
        for k = 1:length(DatosExpP{i}{j})
            DatosExpD{i}{j}{k}=str2num(DatosExpP{i}{j}{k});                       % Conversión de char a decimales
        end
    end
end


%  Datos finales, por columna
for i = 1:NF
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



% Eliminando celdas vacías
% A = cellfun(func,C)
% R(~cellfun('isempty',R))
for i = 1:NF
    for j = 1:Tam(i)
    	DatosCleanOne{i}{j}=DatosCleanOne{i}{j}(~cellfun('isempty',DatosCleanOne{i}{j}));
    	DatosCleanTwo{i}{j}=DatosCleanTwo{i}{j}(~cellfun('isempty',DatosCleanTwo{i}{j}));
    end
end

% Conversión de datos a vectores para tratamiento, visualización y
% almacenamiento
for i = 1:NF
    for j = 1:Tam(i)
        VarX{i}{j}=cell2mat(DatosCleanOne{i}{j});
        VarY{i}{j}=cell2mat(DatosCleanTwo{i}{j});
    end
end  


%% Visualización
Exp="Exp";
for i = 1:NF
    FunNum = Exp + num2str(i);
    LabExp{i} = FunNum;  
    LabelsFigVar{i}= matlab.lang.makeValidName(FunNum);
    LabelsFigVar{i} = figure;
    for j= 1:Tam(i)
        FunNum2 = Exp + num2str(i)+ num2str(j);
        CellLab{i}{j} = FunNum2;
    end
end

for i= 1:NF
    figure(LabelsFigVar{i})
    for j = 1:Tam(i)
        hold on;
        %LineProp = "-" + Colores{k};  
        plot(VarX{i}{j},VarY{i}{j});
        legend(CellLab{i}{1:j},'Location','southwest')
    end
    NamePdf = LabExp{i} + ".pdf"
    saveas(LabelsFigVar{i},char(NamePdf))
end

%% Almacenamiento
for i = 1:NF
    Label = LabExp{i} + ".xlsx";
    for j=1:Tam(i)
        M(:,1) = VarX{i}{j};
        M(:,2) = VarY{i}{j};
        T = array2table(M);
        T.Properties.VariableNames(1:2) = {'X','Y'};
        warning( 'off', 'MATLAB:xlswrite:AddSheet' );
        writetable(T,Label,'Sheet',j) % Sintaxis 
    end
end    
