function [mean,std] = MEANySTD(v)
    n = length(v);
    mean = sum(v)/n;
    std = sqrt(sum((v-mean).^2/n));
end
       

% Ej. 4, Función dentro de otra función
function p = HacerElipse(a,b)
p = @elipse;
   function y = elipse(x)
   y = b*sqrt(1-((x.^2)/(a.^2)));
   end
end


