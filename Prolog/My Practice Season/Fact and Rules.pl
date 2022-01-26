/*Write a Prolog program to represent the following facts and clauses :
a)Marcus was a man.
b)Marcus was a Pompeian.
c)Marcus was born in 40 A.D.
d)All men are mortal.
e)All Pompeians died when the volcano erupted in 79 A.D.
f)No mortal lives longer than 150 years.
g)It is now 2021.
h)Alive means not dead.
i)If someone dies then he is dead at all later times.*/

man(marcus).
pompeian(marcus).
born(marcus,40)
mortal(X):- man(X).
die(X,NOW):- pompeian(X),gt(NOW,79).
gt(X,Y):- X>Y.
alive(X,NOW):- not(die(X,NOW)).
mortal_life(X,Now):- mortal(X), gt(NOW,150). 
now(2021).
