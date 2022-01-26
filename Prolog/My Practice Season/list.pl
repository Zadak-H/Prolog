/* Element is present in a list or not*/
member(X,[X|_]).
member(X,[_|Y]):- member(X,Y).

/* Count the Number of elements in a list*/
list_count([],0).
list_count([_|T],C):- list_count(T,C1), C is C1+1. 

/*The sum of the integers present in a list*/
list_int_sum([],0).
list_int_sum([X|T],S):- integer(X), list_int_sum(T,S1), S is S1 + X.
list_int_sum([X|T],S):- not(integer(X)),list_int_sum(T,S1), S is S1.

/* The sum of the even integers present in a list*/
list_eint_sum([],0).
list_eint_sum([X|T],S):- integer(X),(X mod 2 =:= 0) ,list_eint_sum(T,S1), S is S1 + X.
list_eint_sum([X|T],S):- not(integer(X)),list_eint_sum(T,S1), S is S1; not(X mod 2 =:= 0 ),list_eint_sum(T,S1), S is S1.

/* The position of a given element, if present, in a list*/
list_pos(X,[X|_],1).
list_pos(X,[_|T],Pos):- list_pos(X,T,Pos1), Pos is Pos1+1. 

/* Count the number of times a given element occurs in a list.*/
list_dup_ele(X,[X],1).
list_dup_ele(X,[H|T],C):- X=H,list_dup_ele(X,T,C1), C is C1+1. 
list_dup_ele(X,[H|T],C):- not(X=H),list_dup_ele(X,T,C1), C is C1. 

/* Find the maximum of the integers present in a list*/
list_int_max([],0).
list_int_max([X],X):- integer(X).
list_int_max([H|T],Max):- integer(H), list_int_max(T,Max1), Max1>H , Max is Max1.
list_int_max([H|T],Max):- integer(H), list_int_max(T,Max1), Max1<H , Max is H.
list_int_max([H|T],Max):- not(integer(H)),list_int_max(T,Max1), Max is Max1.


max(A,B,A):- A>B.
max(A,B,B):- A=<B.

maxlist([X],X).
maxlist([X|Y], MAX):- integer(X),maxlist(Y,MAX1), max(X, MAX1, N), MAX is N.
maxlist([X|Y], MAX):- not(integer(X)),maxlist(Y,MAX1), MAX is MAX1.



/* Find the minimum of the integers present in a list*/
min(A,B,A):- A<B.
min(A,B,B):- A>=B.

minlist([X],X).
minlist([X|Y], MIN):- integer(X),minlist(Y,MIN1), min(X, MIN1, N), MIN is N.
minlist([X|Y], MIN):- not(integer(X)),minlist(Y,MIN1), MIN is MIN1.

/* find the average of the integers present in a list*/
count([],0).
count([X|T],C):- integer(X), count(T,C1), C is C1+1. 
count([X|T],C):- not(integer(X)), count(T,C1), C is C1. 

list_avg([],0).
list_avg(X,A):- count(X,N),list_int_sum(X,Sum),N>0, A is (Sum/N).

/* Find the average of the numbers present in a list*/
sNo([],0).
sNo([X|Y], N):- number(X), sNo(Y, N1), N is N1+X.
sNo([X|Y], N):- not(number(X)), sNo(Y, N1), N is N1.

lcount([],0).
lcount([X|T],C):- number(X), lcount(T,C1), C is C1+1. 
lcount([X|T],C):- not(number(X)), lcount(T,C1), C is C1.

list_num_avg([],0).
list_num_avg(X,A):- lcount(X,N),sNo(X,Sum),N>0, A is (Sum/N).

/* Append a list after another*/
list_app([],X,X).
list_app([H|T], X, [H|L]):- list_app(T,X,L).

/* Delete the first element from a list.*/
list_first_del([_|T],T).

/* Delete the last element from a list.*/
list_last_del([_],[]).
list_last_del([H|T],[H|L]):- list_last_del(T,L).

/* Delete the input element from a list.*/
list_del_ele(_,[],[]).
list_del_ele(X,[X|T],NT):-list_del_ele(X,T,NT).
list_del_ele(X,[H|T],[H|NT]):- X\==H, list_del_ele(X,T,NT).

/* Delete the occurrences of all duplicate elements from a list.*/

rem_dupdel(A,B) :- rem_dupdel(A, B, []).
rem_dupdel([],[],_).
rem_dupdel([H|T],[H|O],R) :- not(member(H,R)), rem_dupdel(T,O, [H|R]).
rem_dupdel([H|T],O, R) :- member(H,R), rem_dupdel(T,O,R).

/* Find whether a list is a palindrome or not.*/
concat([],L,L).
concat([X1|L1],L2,[X1|L3]):-concat(L1,L2,L3).

list_rev([],[]).
list_rev([H|T],R):- list_rev(T,RR), concat(RR,[H],R).

palindrome(L):- list_rev(L,L).

/* Divide a given integer list into two sublists depending on an input, N given by the user where all numbers less than N should be put in list - L1 and rest in list- L2. main(X,L):- div_list().*/

/* Union of Two List*/
list_union([],[],[]).
list_union(List1,[],List1).
list_union(List1,[Head2|Tail2],[Head2|Output]):-  
    \+(member(Head2,List1)), list_union(List1,Tail2,Output).
list_union(List1, [Head2|Tail2], Output):-
    member(Head2,List1), list_union(List1,Tail2,Output).  

/* Intersection of Two lists*/
list_inter([],[],[]).
list_inter(_,[],[]).
list_inter(List1,[Head2|Tail2],[Head2|Output]):-  
    (member(Head2,List1)), list_inter(List1,Tail2,Output).
list_inter(List1,[_|Tail2],Output):-  
    list_inter(List1,Tail2,Output).

/* Set Diff between two Lists*/
list_diff([],[],[]).
list_diff(List1,[],List1).
list_diff([Head1|Tail1],List2,[Head1|Output]):- 
    not(member(Head1,List2)),list_diff(Tail1,List2,Output).
list_diff([Head1|Tail1],List2,[_|Tail1]):- 
   member(Head1,List2), list_diff(Tail1,List2,Tail1).

/* Selection sort*/
ssort([],[]).
ssort([M1|S],[H|T]):-smin(H,T,M1),remove(M1,[H|T],N),ssort(S,N).

smin(M,[],M).
smin(M,[H|T],M1):-smin2(M,H,N),smin(N,T,M1).

smin2(A,B,A):-less(A,B).
smin2(A,B,B):-not(less(A,B)).

less(A,B):-(A<B).

append([],B,B).
append([H|A],B,[H|AB]):-append(A,B,AB).

remove(X,L,N):-append(A,[X|B],L),append(A,B,N).

/* Find the frequencies of the elements present in a list*/
frequencies(Xs, Fs) :- frequencies( Xs, [], Fs ).

frequencies( [],     Fs, Fs ).
frequencies( [X|Xs], Ts, Fs ) :-
  tote( X, Ts, T1),
  frequencies(Xs, T1, Fs).

tote( X, Ts, Fs ) :-
  append( Pfx, [X:N|Sfx], Ts),
  !,
  N1 is N+1,
  append( Pfx, [X:N1|Sfx], Fs).
tote( X, Ts, [X:1|Ts] ).