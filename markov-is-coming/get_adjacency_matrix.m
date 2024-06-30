function [Adj] = get_adjacency_matrix(Labyrinth)
  [m n]=size(Labyrinth);
  %{
    Matrice ce îmi indică vecinii unei celule.
    Pozițiile din matrice sunt luate în conformitate cu modul în care verific
    dacă există sau nu un perete în labirint vecin cu celula pe care mă aflu.
  %}
  dir=[0 -1; 0 1; 1 0; -1 0];
  cont=1;
  for i=1:m
    for j=1:n
      for k=1:4
        %{
          Verific dacă am perete sau nu. În cazul în care nu am (mod2 din celulă
          este 0), atunci mă pot duce la celula vecină și, deci, setez cu 1
          valoarea din matrice dintre celula curentă și celula destinație.
        %}
        if mod(Labyrinth(i,j),2)==0
          l(cont)=n*(i-1)+j;
          if(i+dir(k,1)==0)||(i+dir(k,1)==m+1)
            %Cazul în care câștig
            c(cont)=m*n+1;
          elseif(j+dir(k,2)==0)||(j+dir(k,2)==n+1)
            %Cazul în care pierd
            c(cont)=m*n+2;
          else
            %Caz normal
            c(cont)=n*(i-1+dir(k,1))+j+dir(k,2);
          endif
          cont++;
        endif
        Labyrinth(i,j)=fix(Labyrinth(i,j)/2);
      endfor
    endfor
endfor
  %Trec ultimele 2 linii din matricea de adiacență.
  l(cont)=m*n+1;
  c(cont)=m*n+1;
  cont++;
  l(cont)=m*n+2;
  c(cont)=m*n+2;
  Adj = sparse(l, c, 1, m*n+2, m*n+2);
endfunction
