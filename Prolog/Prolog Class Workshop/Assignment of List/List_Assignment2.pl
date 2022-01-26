/*Append List at tail*/

app([],X,X).
app([H|T], X, [H|L]):- app(T,X,L).

/*Delete the First Element From List*/

fdel([_|T], T).

/*Delete the Last Element From List*/

ldel([_],[]).
ldel([H|T], [H|T1]):- ldel(T,T1).

/*Write a Prolog Program to delete a given element from a list. */

del(_,[],[]).
del(X,[X|T],NT):- del(X,T,NT).
del(X,[H|T],[H|NT]):- X\==H, del(X,T,NT).

/*Write a Prolog Program to delete the occurrences of all duplicate elements from a list. */

delall(_,[],[]).
delall(X,[X|T],NT):- delall(X,T,NT).
delall(X,[H|T],[H|NT]):- X\==H, delall(X,T,NT).

