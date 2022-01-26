/* Name – Rajarshi SinhaRoy , Roll – 554*/

/*Write a Prolog Program count the number of elements in a list.*/
list_count([],0):-!.
list_count([_|T],C):- list_count(T,C1), C is C1+1. 

/*Write a Prolog Program to find the sum of the integers present in a list.*/
list_int_sum([],0):-!.
list_int_sum([X|T],S):- integer(X), list_int_sum(T,S1), S is S1 + X.
list_int_sum([X|T],S):- not(integer(X)),list_int_sum(T,S1), S is S1.

/*Write a Prolog Program to find the sum of the even integers present in a list. */
even(X) :- mod(X,2) =:= 0.
sumofeven([], 0):-!.
sumofeven([X|Y], N):- even(X), sumofeven(Y, N1), N is N1+X.
sumofeven([X|Y], N):- not(even(X)), sumofeven(Y, N1), N is N1.

/*Write a Prolog Program to find whether a given element is present in a list Or not*/
member(X, [X|_]):-!.
member(X, [_|Y]):- member(X, Y). 

/*Write a Prolog Program to find the position of a given element, if present, in A list. */
list_pos(X,[X|_],1):-!.
list_pos(X,[_|T],Pos):- list_pos(X,T,Pos1), Pos is Pos1+1. 

/*Write a Prolog Program to count the number of times a given element Occurs in a list. */
list_dup_ele(_,[],0):-!.
list_dup_ele(X,[H|T],C):- X=H,list_dup_ele(X,T,C1), C is C1+1. 
list_dup_ele(X,[H|T],C):- not(X=H),list_dup_ele(X,T,C1), C is C1. 


/*Write a Prolog Program to find the maximum of the integers present in a List. */
max(A,B,A):- A>=B,!.
max(_,B,B).

maxlist([X],X).
maxlist([X|Y], MAX):- integer(X),maxlist(Y,MAX1), max(X, MAX1, N), MAX is N.
maxlist([X|Y], MAX):- not(integer(X)),maxlist(Y,MAX1), MAX is MAX1.

/*Write a Prolog Program to find the minimum of the integers present in a list*/
min(A,B,A):- A<B,!.
min(_,B,B).

minlist([X],X).
minlist([X|Y], MIN):- integer(X),minlist(Y,MIN1), min(X, MIN1, N), MIN is N.
minlist([X|Y], MIN):- not(integer(X)),minlist(Y,MIN1), MIN is MIN1.

/*Write a Prolog Program to find the average of the integers present in a list. */
count([],0):-!.
count([X|T],C):- integer(X), count(T,C1), C is C1+1. 
count([X|T],C):- not(integer(X)), count(T,C1), C is C1. 

list_avg([],0):-!.
list_avg(X,A):- count(X,N),list_int_sum(X,Sum),N>0, A is (Sum/N).

/* Write a Prolog Program to find the average of the numbers present in a list. */
sNo([],0).
sNo([X|Y], N):- number(X), sNo(Y, N1), N is N1+X.
sNo([X|Y], N):- not(number(X)), sNo(Y, N1), N is N1.

lcount([],0).
lcount([X|T],C):- number(X), lcount(T,C1), C is C1+1. 
lcount([X|T],C):- not(number(X)), lcount(T,C1), C is C1.

list_num_avg([],0).
list_num_avg(X,A):- lcount(X,N),sNo(X,Sum),N>0, A is (Sum/N).
