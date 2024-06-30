function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  % Calculez eroarea folosindu-mă de Linear Regression.
  [m]=size(Theta);
  Theta=Theta(2:m);
  [m n]=size(FeatureMatrix);
  Error=0;
  for i=1:m
    h=compute_prediction(Theta, FeatureMatrix, i, n);
    Error+=power(h-Y(i),2);
  endfor
  Error=Error/(2*m);
endfunction
