fibo(0,1).
fibo(1,1).
fibo(N,S):- N>1,N1 is N-1,fibo(N1,X),S is N*X.