function [X, y] = load_dataset(path)
  % Încărcarea din fișierul de tip mat al matricei de features X și al
  % vectorului de labels y.
  fid=fopen(path,'r');
  load(path,'X');
  load(path,'y');
  fclose(fid);
endfunction
