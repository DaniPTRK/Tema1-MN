function [Theta] = conjugate_gradient(A, b, x0, tol, max_iter)
  %{
      Calculez Theta pentru optimizarea funcțiilor de cost folosindu-mă de
      metoda gradientului conjugat.
  %}
  [m n]=size(A);
  r=zeros(m,2);
  v=zeros(m,2);
  r(:,1)=b-A*x0;
  v=r;
  x=x0;
  tolsq=power(tol,2);
  k=1;
  while (k<=max_iter)&&(r(:,1)'*r(:,1)>tolsq)
    t=r(:,1)'*r(:,1)/(v(:,1)'*A*v(:,1));
    x=x+t*v(:,1);
    r(:,2)=r(:,1)-t*A*v(:,1);
    s=r(:,2)'*r(:,2)/(r(:,1)'*r(:,1))
    v(:,2)=r(:,2)+s*v(:,1);
    r(:,1)=r(:,2);
    v(:,1)=v(:,2);
    k++;
  endwhile
  Theta=x;
endfunction
