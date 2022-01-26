/* Write a Prolog program to find the mean of a given list. */

sNo([],0).
sNo([X|Y], N):- number(X), sNo(Y, N1), N is N1+X.
sNo([X|Y], N):- not(number(X)), sNo(Y, N1), N is N1.

lcount([],0).
lcount([X|T],C):- number(X), lcount(T,C1), C is C1+1. 
lcount([X|T],C):- not(number(X)), lcount(T,C1), C is C1.

list_mean([],0).
list_mean(X,A):- lcount(X,N),sNo(X,Sum),N>0, A is (Sum/N).