function [Theta] = normal_equation(FeaturesMatrix, Y, tol, iter)
  [m n]=size(FeaturesMatrix);
  Theta=zeros(n,1);
  %{
    Verific dacă matricea este pătratică și dacă FeaturesMatrix este pozitiv
    definită folosind Cholesky.
  %}
  A=FeaturesMatrix'*FeaturesMatrix;
  b=FeaturesMatrix'*Y;
  try
    L = chol(A);
    Theta=conjugate_gradient(A, b, Theta, tol, iter);
  catch
  end_try_catch
  Theta=[0; Theta];
endfunction
