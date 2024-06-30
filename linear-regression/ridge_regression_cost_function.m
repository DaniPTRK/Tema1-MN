function [Error] = ridge_regression_cost_function(Theta, Y, FeMatrix, lambda)
  %Calculez eroarea folosindu-mă de Ridge Regression.
  Error=linear_regression_cost_function(Theta,Y,FeMatrix);
  Error=Error+lambda*sum(power(Theta,2));
endfunction
