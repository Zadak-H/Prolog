
/*Find the Sum of First N numbers*/


nsum(1,1).
nsum(N,S):- N>1,N1 is N-1,nsum(N1,X),S is N+X.