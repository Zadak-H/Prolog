
/* Vertex - 1,2,3,4,5,6,7,8*/

vertex(v1).
vertex(v2).
vertex(v3).
vertex(v4).
vertex(v5).
vertex(v6).
vertex(v7).
vertex(v8).

/* Edges :-  3->1 , 3->5 , 1->7 , 7->2 , 5->4 , 5->2 , 4->6 , 2->6 , 6->8 , 7->8 */

edge(v3,v1).
edge(v1,v7).
edge(v3,v5).
edge(v7,v2).
edge(v5,v4).
edge(v5,v2).
edge(v4,v6).
edge(v2,v6).
edge(v6,v8).
edge(v7,v8).


/* Find out whether a path exists from a vertex S to a vertex D.*/

path(X,Y) :- not(X==Y), edge(X,Y). 
path(X,Y):- not(X==Y), edge(X,Z), path(Z,Y).

/*Find out the length of the path from a vertex S to a vertex D.*/

len(X,Y,L):- not(X==Y), edge(X,Y), L is 1 .
len(X,Y,L):- not(X==Y), edge(X,Z), len(Z,Y,L1), L is L1+1 .


/* Find out whether a cycle is present involving a given vertex V or not.*/

iscycle(X):- edge(X,Y), path(Y,X).

/* Find out whether a vertex is a source vertex or not.*/

issource(X) :- not(edge(_,X)).

/*Find out whether a vertex is a sink vertex or not.*/

issink(X) :- not(edge(X,_)).

/* Find out whether a vertex is an isolated vertex or not.*/

isisolated(X) :- not(edge(_,X)) , not(edge(X,_)).
