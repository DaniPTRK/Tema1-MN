function [h] = compute_prediction(Theta, FeatureMatrix, curr_pos, n)
  % Calculez valoarea prezisă după formulă.
  h=0;
  h=Theta(1:n)'*FeatureMatrix(curr_pos,:)';
endfunction
