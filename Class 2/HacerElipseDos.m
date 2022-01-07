function p = HacerElipseDos(a,b,c)
p = @elipseDos;

   function y = elipseDos(x)
   y = (b*sqrt(1-((x.^2)/(a.^2))))+c;
   end

end