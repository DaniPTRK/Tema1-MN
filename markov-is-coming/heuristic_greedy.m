function [path] = heuristic_greedy(start_position, probabilities, Adj)
  [n n] = size(Adj);
  path = [start_position];
  %Pregătesc vectorul de vizite.
  visited = zeros(n);
  visited(start_position)=1;
  while size(path)!=0
    max=0;
    position=path(end);
    if Adj(position,n-1)==1
      path=[path n-1];
      path=path';
      %Winning.
      return;
    endif
    %Verific dacă am vecini nevizitați și caut maximul dintre probabilități.
    for i=1:n
      if (Adj(position,i)==1)&&(visited(i)==0)
        if max<probabilities(i)
          max = probabilities(i);
          neigh = i;
        endif
      endif
    endfor
    if max == 0
      %Nu am găsit vecin nevizitat/vecinul era LOSE.
      size(path)=size(path)-1;
    else
      %Trec vecinul în path.
      visited(neigh) = 1;
      path = [path neigh];
    endif
  endwhile
endfunction
