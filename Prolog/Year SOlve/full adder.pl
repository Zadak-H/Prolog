/* Write a prolog program to implement a full adder circuit.*/

and(0,0,0).
and(0,1,0).
and(1,0,0).
and(1,1,1).

or(0,0,0).
or(0,1,1).
or(1,0,1).
or(1,1,1).

xor(0,0,0).
xor(0,1,1).
xor(1,0,1).
xor(1,1,0).


full_adder(A,B,C,S,Ca):-
     xor(A,B,T1),
    xor(C,T1,S),
    and(T1,C,T2),
    and(A,B,T3),
    or(T3,T2,Ca).