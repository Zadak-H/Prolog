/*nesum(N,S):- A is N+1, S is N*A.*/

nsum(1,0).
nsum(N,S):- N>1, N1 is N-1, nsum(N1,X), (N mod 2 =:= 0 -> S is X+N; S = X).