male(john).
male(brian).
male(henry).
male(anthony).
male(bob).
male(peter).
male(denis).
male(charles).
male(ivan).
male(george).
male(kevin).
male(arthur).
male(fred).
male(jason).

female(mary).
female(alice).
female(annie).
female(clara).
female(shelly).
female(ira).
female(mia).
female(jenny).
female(tia).
female(laura).

father(john,alice).
father(john,henry).
father(john,clara).
father(john,bob).
father(brian,peter).
father(brian,denis).
father(henry,ivan).
father(henry,ira).
father(anthony,mia).
father(anthony,kevin).
father(peter,arthur).
father(peter,jenny).
father(charles,tia).
father(charles,laura).
father(george,fred).
father(george,jason).

mother(mary,alice).
mother(mary,henry).
mother(mary,clara).
mother(mary,bob).
mother(alice,peter).
mother(alice,denis).
mother(annie,ivan).
mother(annie,ira).
mother(clara,mia).
mother(clara,kevin).
mother(shelly,arthur).
mother(shelly,jenny).
mother(ira,tia).
mother(ira,laura).
mother(mia,fred).
mother(mia,jason).

/*grandfather(grandfather, grandchild) */
grandfather(X, Y) :- father(X, Z), father(Z, Y).
grandfather(X, Y) :- father(X, Z), mother(Z, Y).
isgrandfather(X) :- grandfather(X,_).

/*grandmother (grandmother, grandchild) */
grandmother(X, Y) :- mother(X, Z), father(Z, Y).
grandmother(X, Y) :- mother(X, Z), mother(Z, Y).
isgrandmother(X) :- grandmother(X,_).

/*parent(father, child)*/
parent(X, Y) :- father(X, Y); mother(X, Y). 
isparent(X) :- parent(X, _).

/*grandparent (grandfather, grandmother) */
grandparent(X, Y) :- grandmother(X, Y).
grandparent(X, Y) :- grandfather(X, Y).
isgrandparent(X) :- grandparent(X, _).

/*sibling(any,any)*/
sibling(X,Y):-father(Z,X),father(Z,Y).
sibling(X,Y):-mother(W,X),mother(W,Y).

/*brother(male,female)*/
brother(X,Y):-father(Z,X),father(Z,Y),male(X),X\==Y.
isbrother(X) :- brother(X,_).

/*sister(male,female)*/
sister(X,Y) :- father(Z,X),father(Z,Y),female(X),X\==Y.
issister(X) :- sister(_,X).

/*Greatgrandfather(greatgrandfather, greatgrandchild)*/
greatgrandfather(X, Y) :- father(X, Z), grandfather(Z, Y).
greatgrandfather(X, Y) :- father(X, Z), grandmother(Z, Y).
isgreatgrandfather(X) :- greatgrandfather(X,_).

/*Greatgrandmother(greatgrandmother, greatgrandchild)*/
greatgrandmother(X, Y) :- mother(X, Z), grandfather(Z, Y).
greatgrandmother(X, Y) :- mother(X, Z), grandmother(Z, Y).
isgreatgrandmother(X) :- greatgrandmother(X,_).

/*greatgrandparent(male,female)*/
greatgrandparent(X,Y) :- greatgrandfather(X,Y).
greatgrandparent(X,Y) :- greatgrandmother(X,Y).

/*cousin(any,any)----> Dublicate values.*/
cousin(X, Y) :- grandparent(Z, X), grandparent(Z, Y), not(sibling(X, Y)), not(X=Y).
cousin(X,Y) :- greatgrandparent(Z,X), greatgrandparent(Z,Y),not(sibling(X, Y)),not(X=Y). 

/*aunt(aunt,nephew)*/
aunt(X, Y) :- parent(Z, Y), sibling(X, Z), female(X).
isaunt(X) :- aunt(X,_).

/*child(cild,parent)*/
child(X, Y) :- parent(Y, X).

ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).

successor(X, Y) :- child(X, Y).
successor(X, Y) :- child(Z, X), successor(Y, Z).


/*Find Uncle Using without Cut*/
uncle(X,Z) :- brother(X,Y), parent(Y,Z).





