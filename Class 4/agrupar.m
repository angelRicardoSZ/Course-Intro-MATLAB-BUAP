function [linea,Datos] = agrupar(linea,fileID)
    i=1;
    while length(linea) > 0 
        Datos{i} = linea;
        i=i+1;
        linea = fgetl(fileID);
    end 
end