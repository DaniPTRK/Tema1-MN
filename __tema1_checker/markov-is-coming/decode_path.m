function [decoded_path] = decode_path(path, lines, cols)
  %Decodific astfel încât path-ul să fie de forma linie,coloana.
  path=path(1:size(path)-1);
  path=path';
  decoded_path=zeros(size(path),2);
  for i=1:size(path,2)
    decoded_path(i,1)=ceil(path(i)/cols);
    decoded_path(i,2)=mod(path(i),cols);
    if decoded_path(i,2)==0
      decoded_path(i,2)=cols;
    endif
  endfor
endfunction
