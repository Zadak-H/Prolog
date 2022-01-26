/*Greather and less than Statement 2 variables.*/

gt(X,Y):- X>Y , write(X), write(' is greater than '), write(Y).
gt(X,Y):- X=:=Y , write(X), write(' is equal to '), write(Y).
gt(X,Y):- X<Y ,write(X), write(' is smaller than ') , write(Y).

/*Greather and less than Statement 3 variables.*/

tgt(X,Y,Z):- X>Y, X>Z , write(X),write(' is biggest.').
tgt(X,Y,Z):- Y>X, Y>Z , write(Y),write(' is biggest.').
tgt(X,Y,Z):- Z>Y,Z>X , write(Z),write(' is biggest.').
