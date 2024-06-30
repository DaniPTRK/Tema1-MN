function [Link] = get_link_matrix(Labyrinth)
  %{
    Mă folosesc de matricea de adiacență și împart valorile de pe linii la suma
    lor.
  %}
  Link=get_adjacency_matrix(Labyrinth);
  [m n]=size(Labyrinth);
  for i =1:m*n+2
    Link(i,1:m*n+2)=Link(i,1:m*n+2)/sum(Link(i,:));
  endfor
endfunction
