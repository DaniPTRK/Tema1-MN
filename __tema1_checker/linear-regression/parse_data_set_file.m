  function [Y, InitialMatrix] = parse_data_set_file(file_path)
  % Citesc din fișierul de tip txt nr de linii m, nr de col n și matricea.
  fid=fopen(file_path,'r');
  m=fscanf(fid, '%d', 1);
  n=fscanf(fid, '%d', 1);
  A=cell(m,n+1);
  for i=1:m
    for j=1:n+1
      A{i,j}=fscanf(fid, '%s', 1);
      % Convertesc string-urile care conțin cifre în double-uri.
      aux=str2double(A{i,j});
      if isnan(aux) == 0
        A{i,j}=aux;
      endif
    endfor
  endfor
  InitialMatrix=A;
  Y=cell2mat(InitialMatrix(1:m,1));
  InitialMatrix=InitialMatrix(1:m,2:n+1);
  fclose(fid);
endfunction
