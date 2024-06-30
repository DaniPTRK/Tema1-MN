function [classes] = predict_classes(X, weights, ...
                  input_layer_size, hidden_layer_size, ...
                  output_layer_size)
  % Determinarea predicțiilor.
  % Obțin Theta din params.
  params1=weights(1:(input_layer_size+1)*hidden_layer_size);
  Theta1=reshape(params1,hidden_layer_size,input_layer_size+1);
  params2=weights((input_layer_size+1)*hidden_layer_size+1:size(weights,1));
  Theta2=reshape(params2,output_layer_size,hidden_layer_size+1);
  [m n]=size(X);
  classes=zeros(m,1);
  %Forward propagation
  a1=[ones(1,m);X'];
  z2=Theta1*a1;
  a2=sigmoid(z2);
  a2=[ones(1,size(a2,2));a2];
  z3=Theta2*a2;
  a3=sigmoid(z3);
  for i=1:m
    %Caut probabilitatea maximă.
    max=0;
    for j=1:10
      if max<a3(j,i)
        classes(i)=j;
        max=a3(j,i);
      endif
    endfor
  endfor
endfunction
