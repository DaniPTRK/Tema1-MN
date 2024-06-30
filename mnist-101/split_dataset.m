function [X_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
  % Împărțirea matricei de features și a vectorului de labels într-o parte
  % de training și una de testing, părți date de percent.
  % percent = fracțiune din setul total ce reprezintă setul de training.
  [m n]=size(X);
  nr_ant=m*percent;
  % Amestecare.
  rando = randperm(m);
  X=X(rando,:);
  y=y(rando,:);
  X_train=X(1:nr_ant,1:n);
  y_train=y(1:nr_ant,1);
  X_test=X(nr_ant+1:m, 1:n);
  y_test=y(nr_ant+1:m, 1);
endfunction
