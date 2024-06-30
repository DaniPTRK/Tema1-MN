function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  %{
      Calculez Theta pentru optimizarea funcțiilor de cost folosindu-mă de
      metoda gradientului descendent.
  %}
  Theta=zeros(n,1);
  for k=1:iter
    for i=1:m
      Error_deriv=0;
      h=compute_prediction(Theta, FeatureMatrix, i, n);
      Error_deriv+=alpha/m*(h-Y(i));
      Theta(:)=Theta(:)-FeatureMatrix(i,:)'*Error_deriv;
    endfor
  endfor
  Theta=[0; Theta];
endfunction
