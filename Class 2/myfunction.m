function b = myfunction(a)          % Funci�n principal
   b = squareMe(a)+doubleMe(a);
end

function y = squareMe(x)            
   y = x.^2;
end

function y = doubleMe(x)            % Funci�n local
   y = x.*2;
end