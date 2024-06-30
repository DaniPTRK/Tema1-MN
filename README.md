# Ion Daniel 315CC - Tema 1 Metode Numerice

## Descriere implementare:

### 1. Markov is coming ...
Pentru acest task, folosesc următoarele funcții:
* parse_Labyrinth(file_path) pe care am realizat-o cu câteva fscanf-uri 
pentru a obține dimensiunea matricei labirint și matricea labirint în sine;
* get_adjacency_matrix(Labyrinth) care îmi returnează matricea de adiacență
a lanțului Markov. Pentru aceasta, mă folosesc de o matrice dir care este 
întotdeauna de dimensiune 4x2. Acest vector îmi indică vecinii celulei pe care
mă aflu printr-o simplă adunare a liniei și, respectiv, coloanei celulei pe care 
mă aflu cu dir(k,1) și, respectiv, dir(k,2). k-ul reprezintă bit-ul pe care îl
verific în momentul respectiv din numărul care se află pe celula unde sunt 
poziționat. Astfel, valorile trecute în matricea dir[] sunt luate în
conformitate cu peretele pe care l-ar desemna un bit de 1 de pe bitul b(k-1).
Așadar, trecând prin k=1:4, verific practic dacă există un perete sau nu și dacă
nu există, realizez o conexiune, adică adaug 1 în matricea de adiacență în funcție
de poziția unde mă aflu eu și poziția destinație. De aici apar 3 cazuri diferite:
când rămân încă în matrice, când ies din matrice sus sau jos (și atunci avem win)
sau când ies din matrice la stânga sau la dreapta (și atunci avem lose). Fiecare
caz este tratat dând valori diferite vectorului de coloane c. În final, realizez
și ultimele linii ale matricii de adiacență și returnez matricea rară;
* get_link_matrix(Labyrinth), unde mă folosesc, de fapt, de 
get_adjacency_matrix(Labyrinth). După ce realizez matricea de adiacență, împart
valorile nenule de pe o linie la suma acestora.
* get_Jacobi_parameters(Link), unde împart practic matricea Link în 2 matrici
diferite, G unde am matricea de iterație și c unde am vectorul de iterație.
* perform_iterative(G,c,x0,tol,max_steps), unde aplic de mai multe ori
formula x=G*x0+c până când obțin un vector de soluții aproximative.
* heuristic_greedy(start_position, probabilities, Adj) pentru a obține
drumul de la start_position la pozitia de castig. Folosesc un vector path în care
voi ține minte celulele prin care am trecut până la câștig (dacă este posibil
să ajung) și un vector de vizite ce-mi indică dacă am trecut deja printr-o 
celulă (inițial vectorul este zeros(n), iar în timp ce vizitez o celulă,
acesta primește valoarea 1 pe poziția corespondentă celulei). Path-ul îl
folosesc ca pe o stivă, în sensul că dacă nu mai am vecini nevizitați în jurul
ultimei poziții adăugate în vector, scot această poziție și caut altă celulă
ce mă va duce pe alt drum. Celulele sunt alese doar dacă există o conexiune
între celula curentă și cea la care vreau să mă deplasez 
(Adj(position,i) este 1) și dacă probabilitatea de câștig în acea celulă este
maximă.
* decode_path(path, lines, cols), unde decodific celulele din path după
numărul de linii și de coloane din labirint astfel încât să pot afișa drumul
sub forma linie,coloană.

### 2. Linear Regression

Pentru acest task, folosesc următoarele funcții:
* parse_data_set_file(file_path) pe care am realizat-o utilizând fscanf.
Datele pe care le citesc le salvez într-un array de cell-uri, inițial toate
cell-urile fiind de tip string. După ce convertesc string-urile ce pot fi
convertite în numere, trec prima coloană a matricii citite în Y și restul
matricii în InitialMatrix.
* parse_data_csv_file(file_path) unde citesc linie cu linie din fișierul
csv, după care dau strsplit, folosind ca delimitator virgula dintre elemente.
După ce folosesc strsplit, trec rezultatul obținut într-o linie a lui
InitialMatrix, iar, după ce termin de citit din fișier, convertesc 
string-urile ce pot fi convertite în numere, trec prima coloană a matricii 
în Y și restul matricii în InitialMatrix.
* prepare_for_regression(InitialMatrix) unde inițializez un vector
de string-uri "tochange" pe care-l folosesc pentru a detecta ce se află
în interiorul celulei la care mă aflu în InitialMatrix. De data aceasta,
pentru eficiență, parcurg matricea pe coloane și verific dacă primul element
de pe coloană este sau nu în vectorul tochange(OK = 1 dacă este). Dacă OK=0,
atunci coloana pe care mă aflu are doar int-uri, deci nu are sens să parcurg
restul coloanei. Dacă OK=1, atribui în funcție de variabila k, folosită ca și
contor pentru a trece prin elementele lui tochange, valorile date în enunț.
* compute_prediction( Theta, FeatureMatrix, curr_pos, n) este o funcție
auxiliară ce returnează valoarea prezisă utilizând formula din suportul teoretic.
* linear_regression_cost_function(Theta, Y, FeatureMatrix) îmi returnează
eroarea dintre valoarea reală și cea prezisă folosindu-mă de Linear
Regression. Funcția primește informații de la compute_prediction() pentru a
calcula eroarea.
* ridge_regression_cost_function(Theta, Y, FeMatrix, lambda) este o
funcție analog funcției linear_regression_cost_function, doar că folosesc metoda
Ridge Regression.
* lasso_regression_cost_function(Theta, Y, FeMatrix, lambda) este o
funcție analog funcției linear_regression_cost_function, doar că folosesc metoda
Lasso Regression.
* gradient_descent(FeatureMatrix, Y, n, m, alpha, iter) unde calculez Theta
după iter iterații pentru a optimiza funcțiile de cost. Pentru a face acest lucru,
mă folosesc de metoda Gradientului Descendent și de compute_prediction().
* normal_equation(FeaturesMatrix, Y, tol, iter) unde verific utilizându-mă
de Cholesky() dacă matricea pe care o am este una pozitiv definită sau nu. În
cazul în care este, apelez conjugate_gradient() pentru a calcula Theta-ul.
* conjugate_gradient(A, b, x0, tol, max_iter) unde A este FeatureMatrix,
b este Y și x0 este zeros(n,1). În cadrul acestei funcții calculez Theta-ul
folosindu-mă de metoda Gradientului Conjugat.

### 3. MNIST 101

Pentru acest task, folosesc următoarele funcții:
* load_dataset(file_path) pe care am realizat-o utilizând funcția load().
Aici citesc din fișierul .mat matricea de features X și vectorul de labels y.
* split_dataset(X, y, percent) unde împart setul primit, după ce îl
amestec folosind randperm, în 2 părți, un set de antrenare și un test de
testare în funcție de percent. Percent îmi indică cât la sută din numărul de
seturi primite ca input reprezintă seturi de antrenare.
* initalize_weights(L_prev, L_next) unde inițializez vectorul de
weights cu valori aleatorii din intervalul (-e,e). Aceste valori sunt calculate
după formula e=sqrt(6)/sqrt(L_prev+L_next), unde L_prev este numărul de neuroni
de pe layer-ul anterior și L_next numărul de neuroni de pe următorul layer.
Pentru a obține valorile random efective, mă folosesc de funcția rand()
ce-mi generează o matrice cu valori între 0 și 1, valori ce le înmulțesc
cu (e-(-e)) iar apoi le scad cu e pentru a obține valori din intervalul (-e,e).
* cost_function(params, X, y, lambda, input_layer_size, hidden_layer_size,
output_layer_size) unde calculez funcția de cost și matricea desfășurată a
gradienților. Inițial, împart vectorul coloană params în 2 părți pentru a
obține cele 2 matrici Theta1 și Theta2, folosindu-mă de layer size-urile
primite ca parametrii ale funcției. Astfel, salvez într-un vector coloană
params1 toate valorile lui Theta1, de la 1 la 
(input_layer_size+1)*hidden_layer_size, iar restul valorilor le trec
în alt vector coloană params2, unde se vor afla valorile lui Theta2.
Dând reshape acestor vectori, obțin cele 2 matrici necesare transformărilor
liniare. După aceea, inițializez matricea vectorului de labels "explicitat",
unde toate valorile de pe o coloană sunt 0 mai puțin locul unde se află y(i),
adică label-ul testului i. Această matrice indică, practic, predicțiile așteptate
și va fi folosită pentru determinarea erorilor de calcul în backpropagation.
În cadrul acestei funcții, împart funcția de cost în 2 sub-funcții,
prima sub-funcție fiind cea în care se realizează cross entropy, iar cea
de-a doua subfuncție, cea care calculează suma pătratelor din cele 2 matrici
Theta. Realizez forward propagation pentru a obține predicțiile pentru fiecare
clasă, iar după aceea calculez erorile folosind backpropagation, salvând aceste erori
în matricile de gradienți delta1 și delta2 și determinând, după aceea, matricea
desfășurată a gradienților. După ce calculez prima parte din funcția de cost,
optimizând prin vectorizare calculele, calculez și cea de-a doua parte și adun
rezultatele obținute, găsind astfel funcția de cost.
* predict_classes(X,weights,input_layer_size,hidden_layer_size,
output_layer_size) unde, bazându-mă pe vectorul weights, determin predicțiile
finale pentru setul de teste primit. Implementarea este similară cu cea din
cost_function(), în sensul că obțin cele 2 matrici Theta1 și Theta2 în același
mod, doar că de data aceasta împart vectorul weights și aplic forward propagation.
După forward propagation, caut predicțiile cu valoare maximă, pe coloane,
trecând indexul pe care se află valoarea maximă în vectorul classes(), 
vector ce va indica predicțiile finale pentru fiecare linie din setul de teste.
