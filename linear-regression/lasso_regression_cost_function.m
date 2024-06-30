function [Error] = lasso_regression_cost_function(Theta, Y, FeMatrix, lambda)
  % Calculez eroarea folosind Lasso Regression.
  [m]=size(Theta);
  Theta=Theta(2:m);
  [m n]=size(FeMatrix);
  Error=0;
  for i=1:m
    h=compute_prediction(Theta, FeMatrix, i, n);
    Error+=power(Y(i)-h,2);
  endfor
  Error=Error/m;
  Error=Error+lambda*sum(abs(Theta(:)));
endfunction
