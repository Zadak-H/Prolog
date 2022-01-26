/* Write a Prolog program to find the GCD of two given numbers. */
/*
gcd(X, Y, Z) :-
    X < 0, !,
    gcd(-X, Y, Z).
gcd(X, Y, Z) :-
    Y < 0, !,
    gcd(X, -Y, Z).
gcd(X, 0, X) :- X > 0.
gcd(0, Y, Y) :- Y > 0.
gcd(X, Y, Z) :-
    X > Y, Y > 0,
    X1 is X - Y,
    gcd(Y, X1, Z).
gcd(X, Y, Z) :-
    X =< Y, X > 0,
    Y1 is Y - X,
    gcd(X, Y1, Z).

*/

gcd(X, 0, X):- !.
gcd(0, X, X):- !.
gcd(X, Y, D):- X =< Y, !, Z is Y - X, gcd(X, Z, D).
gcd(X, Y, D):- gcd(Y, X, D).