/*Write a Prolog program to define predicates and/2, or/2, nand/2, nor/2, which succeed or fail according to the result of their respective operations; e.g. and (A, B) will succeed,
if and only if both A and B succeed. Note that A and B can be Prolog goals (not only the constants true and fail). A logical Xession in two variables can then be written in
prefix notation, as in the following example: and (or (A, B), nand (A, B)). Now, write a predicate table/3 which prints the truth table of a given logical Xession in two
variables.*/
    
and(A,B) :- A, B.
or(A,_) :- A.
or(_,B) :- B.
nand(A,B) :- not(and(A,B)).
nor(A,B) :- not(or(A,B)).

bind(true).
bind(fail).

truth_table(A,B,X) :- bind(A), bind(B), f(A,B,X), fail.
f(A,B,_) :- write(A), write('  '), write(B), write('  '), fail.
f(_,_,X) :- X, !, write(true), nl.
f(_,_,_) :- write(fail), nl.








