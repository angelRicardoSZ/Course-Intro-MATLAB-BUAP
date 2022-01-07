function ExpVar = lectura(filename) 
    fileID = fopen(filename);
    RowsCal = ConReng(fileID);
    linea = fgetl(fileID);
    
    i=1;  
    j=1;
    RowsEje = 0;
    while RowsEje < RowsCal 
        [linea,vacio(i)] = RowVacio(linea,fileID);    % Obtiene los espacios vacíos
        i=i+1;
        if  RowsCal - RowsEje  < 100
            break
        end    
        [linea,ExpVar{j}] = agrupar(linea,fileID);
        for k=1:j
        dim(k)=length(ExpVar{k});
        end
        j = j + 1;
        RowsEje = sum(dim)+sum(vacio);
    end
    fclose(fileID);
    return 
end