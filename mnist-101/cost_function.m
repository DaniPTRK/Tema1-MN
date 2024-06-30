function [J, grad] = cost_function(params, X, y, lambda, ...
                   input_layer_size, hidden_layer_size, ...
                   output_layer_size)
  % Calcularea funcției de cost J și a matricei desfășurate a gradienților.
  [m n]=size(X);
  % Obține Theta din params.
  params1=params(1:(input_layer_size+1)*hidden_layer_size);
  Theta1=reshape(params1,hidden_layer_size,input_layer_size+1);
  params2=params((input_layer_size+1)*hidden_layer_size+1:size(params,1));
  Theta2=reshape(params2,output_layer_size,hidden_layer_size+1);
  % Inițializarea matricii vectorului labels explicitat.
  Y=zeros(10,m);
  for i=1:m
    Y(y(i),i)=1;
  endfor
  % Forward propagation
  a1=[ones(1,m);X'];
  z2=Theta1*a1;
  a2=sigmoid(z2);
  a2=[ones(1,size(a2,2));a2];
  z3=Theta2*a2;
  a3=sigmoid(z3);
  % Calculează eroarea pe layerul intermediar și cel de output
  % și realizează backpropagation.
  % Determină gradienți.
  s3=a3-Y;
  delta2=s3*a2';
  s2=Theta2'*s3;
  s2=s2(2:size(s2,1),:);
  a2=a2(2:size(a2,1),:);
  s2=s2.*(a2.*(1-a2));
  delta1=s2*a1';
  Theta1(1:size(Theta1,1),1)=0;
  Theta2(1:size(Theta2,1),1)=0;
  % Determină gradienții finali și cuplează cele 2 matrici pentru a obține
  % matricea desfășurată.
  delta1=1/m*delta1+lambda/m*Theta1;
  delta2=1/m*delta2+lambda/m*Theta2;
  grad=[delta1(:);delta2(:)];
  % Calculează prima parte din funcția de cost.
  J1=-Y(:)'*log(a3(:))-(1-Y(:)')*log(1-a3(:));
  J1=J1/m;
  % Calculează a doua parte din funcția de cost.
  J2=Theta1(:)'*Theta1(:)+Theta2(:)'*Theta2(:);
  J2=lambda/(2*m)*J2;
  % Obține funcția de cost finală.
  J=J1+J2;
endfunction
