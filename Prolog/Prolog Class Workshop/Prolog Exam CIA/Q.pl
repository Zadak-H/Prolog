
    man(marcus).
    pompeian(marcus).
	born(Marcus, 40).
	mortal(X):- man(X).
    ldie(X,Now) :- pompeian(X),lgt(Now,79).
    alive(X,Now) :- not(ldie(X,Now)).
    lgt(Op1,Op2) :- Op1 > Op2.
	Mortal_life(X,Now) :- mortal(X), not(gt(Now,150)).