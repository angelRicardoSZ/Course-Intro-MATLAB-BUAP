% Esta funci�n te permite contar los espacios vac�os

function [linea, vacio] = RowVacio(linea,fileID)
    vacio = 0;
    while isempty(linea)                             % Mientras este vac�o
        linea = fgetl(fileID);                       % solo lee, pero no
                                                     % hace nada
        vacio=vacio+1;
    end 

end