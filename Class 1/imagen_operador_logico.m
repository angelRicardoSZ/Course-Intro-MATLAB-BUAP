% Figura 1
N=512;                  
x=-N/2:1:N/2;               
y=-N/2:1:N/2; 
[Mx,My]=meshgrid(x,y);
R=sqrt(Mx.^2+My.^2);
filtro_1=(Mx>0 & R>100);
imshow(filtro_1)
% Figura 2
N=512;                  
x=-N/2:1:N/2;               
y=-N/2:1:N/2; 
[Mx,My]=meshgrid(x,y);
R=sqrt(Mx.^2+My.^2);
filtro_2=(Mx<0 & R<100 | R>100 & Mx>0);
imshow(filtro_2)
% Figura 3
N=512;                  
x=-N/2:1:N/2;               
y=-N/2:1:N/2; 
[Mx,My]=meshgrid(x,y);
R=sqrt(Mx.^2+My.^2);
filtro_3=(My>0 & R<100 | R>100 & Mx>0);
imshow(filtro_3)
% Figura 4
N=512;                  
x=-N/2:1:N/2;               
y=-N/2:1:N/2; 
[Mx,My]=meshgrid(x,y);
R=sqrt(Mx.^2+My.^2);
filtro_4=(My>0 & Mx>0 |  My<0 & Mx<0 );
imshow(filtro_4)
% Figura 5
N=512;                  
x=-N/2:1:N/2;               
y=-N/2:1:N/2; 
[Mx,My]=meshgrid(x,y);
R=sqrt(Mx.^2+My.^2);
filtro_5=(Mx>0 & My>0 | Mx<0 & My<0 | R<256);
imshow(filtro_5)
% Figura 6
N=512;                  
x=-N/2:1:N/2;               
y=-N/2:1:N/2; 
[Mx,My]=meshgrid(x,y);
R=sqrt(Mx.^2+My.^2);
filtro_6=(My>0 & R<256 | My<0& R>256 );
imshow(filtro_6)
% Figura 7
N=512;                  
x=-N/2:1:N/2;               
y=-N/2:1:N/2; 
[Mx,My]=meshgrid(x,y);
R=sqrt(Mx.^2+My.^2);
filtro_7=(Mx>0 & R>256);
imshow(filtro_7)

