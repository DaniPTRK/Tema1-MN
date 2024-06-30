function [Y, InitialMatrix] = parse_csv_file(file_path)
  % Citesc din fișierul de tip csv array-ul de cell-uri.
  fid=fopen(file_path,'r');
  %Citesc prima linie.
  line=fgetl(fid);
  line=strsplit(line,',');
  InitialMatrix=cell(1,size(line,2));
  InitialMatrix=line;
  while !feof(fid)
    %Citesc restul liniilor.
    line=fgetl(fid);
    line=strsplit(line,',');
    InitialMatrix=[InitialMatrix;line];
  endwhile
  [m n]=size(InitialMatrix);
  for i=1:m
    for j=1:n
      % Convertesc string-urile care conțin cifre în double-uri.
      aux=str2double(InitialMatrix{i,j});
      if isnan(aux) == 0
        InitialMatrix{i,j}=aux;
      endif
    endfor
  endfor
  %Împart matricea între Y și InitialMatrix.
  Y=cell2mat(InitialMatrix(2:m,1));
  InitialMatrix=InitialMatrix(2:m,2:n);
  fclose(fid);
endfunction
