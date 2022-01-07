function Result = Improvedtwo(filename) 
	fileID = fopen(filename);
    RowsCal = ConReng(fileID);                     % Conteo renglones
    FileDate =  textscan(fileID,'%D %*[^\n]',1);   % fecha experimento 
    LenFileDate = size(FileDate,1);
    FileInfor = textscan(fileID,'%s %*[^\n]',8);   % Info experimento 
    FileDat = textscan(fileID,'%s %s',1321);       % Lectura de datos
    for i = 1:1321
        FileDat{1}{i,1} = strrep(FileDat{1}{i,1},',','.');
        FMat(i,1) = str2num(FileDat{1}{i,1});
    end    
    
end
