%% --- Clase Tres --- 
% Lectura de archivos, visualización, almacenamiento y escritura de achivos
%NombreVar = xlsread(NombreArchivo,Hoja,xlRango) % Sintaxis
           % Nombre Archivo: con termiación xlsx, se escribe como caracter
           % Hoja: Especifica la hoja de la que se tomara la información
           % xlRango: Lee el rango especificado de la hoja seleccionada, 
           
%% Ej. 1

E = xlsread('DatosFunDielAuAg.xlsx','Datos Au','A1:A50');   %Energía
RealAu = xlsread('DatosFunDielAuAg.xlsx','Datos Au','B1:B50');   %Parte real Au
ImagAu = xlsread('DatosFunDielAuAg.xlsx','Datos Au','C1:C50');   %Parte Imag Au

RealAg = xlsread('DatosFunDielAuAg.xlsx','Datos Ag','B1:B50');   %Parte real Au
ImagAg = xlsread('DatosFunDielAuAg.xlsx','Datos Ag','C1:C50');   %Parte Imag Au


% Visaulización
subplot(1,2,1); % Real
plot(E,RealAu,'bo','LineWidth',1);
hold on
plot(E,RealAg,'ro','LineWidth',1);
grid on
title('Parte real','FontSize',18) 
xlabel('Energia (eV)','FontSize',16) 
ylabel('\Re (\epsilon)','FontSize',16) 
legend({'RealAu','RealAg'},'FontSize',16)

subplot(1,2,2); % Imaginaria
plot(E,ImagAu,'b-','LineWidth',1);
hold on
plot(E,ImagAg,'r-','LineWidth',1);
grid on
title('Parte imaginaria','FontSize',18)
xlabel('Energia (eV) ','FontSize',16) 
ylabel('\Im (\epsilon)','FontSize',16) 
legend({'Imag Au','Imag Ag'},'FontSize',16)
%% Ej. 2, lectura por página
NombreArchivo = 'DatosExp.xlsx';            % Declarar el nombre del archivo a leer
[~,NombrePag]= xlsfinfo(NombreArchivo);     %

NumPag = length(NombrePag);

for i=1:NumPag
    DatosPag{i} = xlsread(NombreArchivo,i);
end    
% Visaulización parte real y parte imaginaria en misma ventana
rows=size(DatosPag{1},1);
columns=size(DatosPag{1},2);

Labels = {"Longitud de onda","Real Au","Imag Au"};
f1 = figure;
f2 = figure;
f3 = figure;

figure(f1);
for i=2:rows
    
    plot(DatosPag{1}(1,:),DatosPag{1}(i,:));
    hold on
    legend(Labels(2:i),'FontSize',16);
    title("Parte real " + NombrePag{1})
end

figure(f2);
for i=2:rows
    plot(DatosPag{2}(1,:),DatosPag{2}(i,:));
    hold on
    legend(Labels(2:i),'FontSize',16);
    title("Parte real " + NombrePag{2})
end

figure(f3);
for i=2:rows
    plot(DatosPag{3}(1,:),DatosPag{3}(i,:));
    hold on
    legend(Labels(2:i),'FontSize',16);
    title("Parte real " + NombrePag{3})
end
%% Modifiación 1 del Ej. 2
% Lectura de cada página del archivo
NombreArchivo = 'DatosExp.xlsx';            % Declarar el nombre del archivo a leer
[~,NombrePag]= xlsfinfo(NombreArchivo);

NumPag = length(NombrePag);
DatosPag = cell([1 NumPag]);
for i=1:NumPag
    DatosPag{i} = xlsread(NombreArchivo,i);
end    

% Visaulización parte real y parte imaginaria en misma ventana
rows=size(DatosPag{1},1);
columns=size(DatosPag{1},2);
Labels = {"Longitud de onda","Real Au","Imag Au"};

LabelsFigVar=cell([1 NumPag]);
for i=1:NumPag
    LabelsFig = "f" + num2str(NumPag);
    LabelsFigVar{i} = matlab.lang.makeValidName(LabelsFig);
    LabelsFigVar{i} = figure;
end    
%
for j=1:NumPag
    figure(LabelsFigVar{j});
    for i=2:rows
    plot(DatosPag{j}(1,:),DatosPag{j}(i,:));
    hold on
    legend(Labels(2:i),'FontSize',16);
    title("Parte real " + NombrePag{j})
    end
end

%% Escritura de archivos 
xlswrite(NombreArchivo,Matriz,Hoja,xlRango) % Sintaxis 

% Ej. 3 
NombreArchivo = 'Archivo.xlsx';
A = [12.7 5.02 -98 63.9 0 -.2 56];
xlswrite(NombreArchivo,A)

% Ej. 4
NombreArchivo = 'ArchivoDos.xlsx';
MatDat = {'Tiempo','Temperatura'; 12,98; 13,99; 14,97};
Pag = 2;
xlRango = 'E1';
xlswrite(NombreArchivo,MatDat,Pag,xlRango)


%% fopen
                %   Se utiliza para poder obtener información de un archivo
                %   fileID = fopen(filename,permission)
                %   Abre el archivo con el tipo de permiso establecido
                %   'r' lectura
                %   'w'  crea o abre un archivo existente, borra
                %   información en caso de que se tuviera
                %   'a' agrega información al archivo al final del archivo
                



%% Archivos txt

% Ej. 1                                         
fileID = fopen('Ej1.txt','r');
text=textscan(fileID ,'%f',4,'Delimiter',',');  %   Regresa los datos en una celda
fclose(fileID)


%  Ej. 2.
filename = 'Ej2.txt';
fileID = fopen(filename);
formatSpec = '%s';
N = 4;
C_text = textscan(fileID,formatSpec,N,'Delimiter','|');
C_data0 = textscan(fileID,'%d %f %f %f')
fclose(fileID)

%% Ej. 3

filename = 'Ej3.txt';
fileID = fopen(filename);
fgets(fileID)    % Incluye el caracater de nueva linea
fgetl(fileID)    % No Incluye el caracater de nueva linea
% Reiniciar frewind(fid);
fclose(fileID)



%% Ej. 4, Lectura automatizada de datos UV-VIS en formato tsv

filename = 'UV-Vis 11_06_2019 19_15_07.tsv';
fileID = fopen(filename);
fgets(fileID)    % Incluye el caracater de nueva linea
fgetl(fileID)    % No Incluye el caracater de nueva linea
% Reiniciar frewind(fid);
% Saltar las primeras lineas
for k=1:9
    tline = fgets(fileID)
end

for k=1:1321
    Datos{k} = fgetl(fileID);
end


%% V2
k=1;
line = fgetl(fileID);
while length(line) > 0 
	Datos{k} = line;
    k=k+1;
    line = fgetl(fileID);
end    

while isempty(line) 
	line = fgetl(fileID);
end 

j=1;
while length(line) > 0 
	Datos{j} = line;
    j=j+1;
    line = fgetl(fileID);
end 

while isempty(line) 
	line = fgetl(fileID);
end 

i=1;
while length(line) > 0 
	Datos{i} = line;
    i=i+1;
    line = fgetl(fileID);
    return
end 




%% V3
filename = 'UV-Vis 11_06_2019 19_15_07.tsv';    % Nombre del archivo

function ExpVar = lectura(filename) 
    fileID = fopen(filename);
    RowsCal = ConReng(fileID);
    linea = fgetl(fileID);
    
    i=1;  
    j=1;
    RowsEje = 0;
    while RowsEje < RowsCal
          
        [linea,vacio(i)] = RowVacio(linea,fileID);
        i=i+1;
        if  RowsCal - RowsEje  < 100
            return
        end    
        [linea,ExpVar{j}] = agrupar(linea,fileID);
        for k=1:j
        dim(k)=length(ExpVar{k})
        end
        j = j + 1;
        RowsEje = sum(dim)+sum(vacio);
    end
    fclose(fileID)
    return 
end

% Tratmiento de strings 
ExpDec = strrep(Exp,',','.');
for i=1:(n-1)
    ExpVal{i} = str2num(ExpDec{i});
end

for i=1:(n-1)
    Clean{i}=ExpVal(ExpVal{i}>0);
end


for i=10:1330
    Dat4(i) = ExpVal{i}(1);
end

%% CSV
filename = 'Advertising.csv';    % Solo lee datos númericos
M = csvread(filename,2);
fclose(filename)

%% Readtable
%  Crea una variable en T para cada columna en el archivo
%  lee los nombres de las variables en el primer renglon
%  crea el tipo adecuado para las variables 

% Ej. 1
filename = 'Advertising.csv';
T = readtable(filename);
% Ej. 2
filename = 'Ej4.txt';
T = readtable(filename,'Format','%s%s%u%f%f%s');
T = readtable(filename,'ReadRowNames',true);        % Nombres de variable en
                                                    % primera columna y 
                                                    % nombre de renglon
T('Wu',:)   % es posible acceder con el nombre del renglon
T('Johnson','Genero');