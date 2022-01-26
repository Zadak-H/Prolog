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
parent(X, Y) :- father(X, Y).
parent(X, Y) :- mother(X, Y). 
isparent(X) :- parent(X, _).

/*grandparent (grandfather, grandchild) */
grandparent(X, Y) :- grandmother(X, Y).
grandparent(X, Y) :- grandfather(X, Y).
isgrandparent(X) :- grandparent(X, _).


/*brother(male,female)*/
brother(X,Y):-father(Z,X),father(Z,Y),male(X),X\==Y.
isbrother(X) :- brother(X,_).

/*sister(male,female)*/
sister(X,Y) :- father(Z,X),father(Z,Y),female(X),X\==Y.
issister(X) :- sister(_,X).

/*child(cild,parent)*/
child(X, Y) :- parent(Y, X).

/*ancestor*/
ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).

/*successor*/
successor(X, Y) :- child(X, Y).
successor(X, Y) :- child(Z, X), successor(Y, Z).


/* Sibling with cut */
cut_sibling(X,Y):-parent(P,X), !, parent(P,Y),X\=Y.

/* Cousin with cut (!) */
cut_cousin(X,Y):- parent(A,X),parent(B,Y),X\=Y, cut_sibling(A,B).

/* Uncle with cut (!) */
cut_uncle(X,Y):-parent(Z,Y),cut_sibling(X,Z),male(X).

/* Aunt with cut (!) */
cut_aunt(X,Y):-parent(Z,Y),cut_sibling(X,Z),female(X).
