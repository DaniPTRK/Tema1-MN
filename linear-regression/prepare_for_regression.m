function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  [m n]=size(InitialMatrix);
  %{
     Inițializez un vector de string-uri pentru valorile pe care vreau să le
     schimb cu 1 sau cu 0.
  %}
  tochange={"yes"; "no"; "furnished"; "semi-furnished"; "unfurnished"};
  for i=1:n
    OK=0;
    for j=1:m
      for k=1:size(tochange,1)
        if strcmp(InitialMatrix{j,i},tochange{k,:})==1
          if(k>=3)&&(OK==0)&&(i!=n)
          %Dacă avem furnished/semi-furnished/unfurnished, mai adăugăm o col.
            Aux=InitialMatrix(:,i+1:n);
            InitialMatrix=InitialMatrix(:,1:i+1);
            InitialMatrix=[InitialMatrix,cell(m,1),Aux];
            n++;
            OK=1;
          endif
          %Cazuri luate după k, k fiind folosit în tochange{k}.
          switch(k)
            case 1
              InitialMatrix{j,i}=1;
              break;
            case 2
              InitialMatrix{j,i}=0;
              break;
            case 3
              InitialMatrix{j,i}=0;
              InitialMatrix{j,i+1}=0;
              break;
            case 4
              InitialMatrix{j,i}=1;
              InitialMatrix{j,i+1}=0;
              break;
            case 5
              InitialMatrix{j,i}=0;
              InitialMatrix{j,i+1}=1;
              break;
          endswitch
          k=size(tochange,1);
        endif
      endfor
      if OK==0
        %N-am găsit string-uri, mă mut pe următoarea coloană.
        j=m;
      endif
    endfor
  endfor
  %Trec din cell-uri în matrice.
  FeatureMatrix=cell2mat(InitialMatrix);
endfunction
