% Esta función te permite contar los espacios vacíos

function [linea, vacio] = RowVacio(linea,fileID)
    vacio = 0;
    while isempty(linea)                             % Mientras este vacío
        linea = fgetl(fileID);                       % solo lee, pero no
                                                     % hace nada
        vacio=vacio+1;
    end 

end