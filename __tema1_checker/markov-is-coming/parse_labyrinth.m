function [Labyrinth] = parse_labyrinth(file_path)
  %Citesc din fișier nr de linii m, nr de coloane n și matricea Labyrinth
  fid=fopen(file_path,'r');
  n=fscanf(fid, '%d', 1);
  m=fscanf(fid, '%d', 1);
  A=fscanf(fid, '%d', [m n]);
  Labyrinth=A';
  fclose(fid);
endfunction
