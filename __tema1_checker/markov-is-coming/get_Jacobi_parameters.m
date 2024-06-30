function [G, c] = get_Jacobi_parameters(Link)
  %"Împart" matricea legăturilor între G și c.
  [n n]=size(Link);
  G = Link(1:n-2,1:n-2);
  c = Link(1:n-2,n-1);
endfunction
