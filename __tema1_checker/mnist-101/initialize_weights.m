function [matrix] = initialize_weights(L_prev, L_next)
  % Inițializarea vectorului de weights cu valori aleatorii de la -e la e
  % în funcție de numărul de neuroni de pe stratul anterior și stratul
  % următor.
  aux=sqrt(6)/sqrt(L_prev+L_next);
  matrix=2*aux*rand(L_prev+1,L_next);
  matrix=matrix-aux;
endfunction
