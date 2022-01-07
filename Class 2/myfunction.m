function b = myfunction(a)          % Función principal
   b = squareMe(a)+doubleMe(a);
end

function y = squareMe(x)            
   y = x.^2;
end

function y = doubleMe(x)            % Función local
   y = x.*2;
end