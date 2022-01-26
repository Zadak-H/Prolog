fact(0,1).
fact(1,1).
fact(N,S):- N>1,N1 is N-1,fact(N1,X),S is N * X.
