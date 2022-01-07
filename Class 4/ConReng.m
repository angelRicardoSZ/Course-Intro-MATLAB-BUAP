%  Permite contar los renglones de un archivo 

function Rows = ConReng(fileID)
    tline = fgetl(fileID);          % Lee la primera linea       
    Rows = 1;                       % Inicia en 1
    while ischar(tline)             % Mientras tenga un caracter continua leyendo    
        tline = fgetl(fileID);      % Obtiene la siguiente linea
        Rows = Rows+1;              % Suma 1 al contador    
    end
    frewind(fileID);                % regresa el indicador al inicio
end