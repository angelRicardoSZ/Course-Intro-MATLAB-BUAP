% Ej. 4, Funci�n dentro de otra funci�n
function p = HacerElipse(a,b)
p = @elipse;

   function y = elipse(x)
   y = b*sqrt(1-((x.^2)/(a.^2)));
   end

end