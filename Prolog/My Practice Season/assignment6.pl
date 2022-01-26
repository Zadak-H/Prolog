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



/*Merge two sorted list*/

merge([],[],[]).
merge([A],[],[A]).
merge([],[B],[B]).
merge([H1|L1],[H2|L2],[H1|L]):-
	H1 =< H2, merge(L1,[H2|L2],L).
merge([H1|L1],[H2|L2],[H2|L]):-
	H1 > H2, merge([H1|L1],L2,L).
	
/*Write a Program for Bubble Sort*/

bubble_sort([],Sorted) :- 
	Sorted = [].
bubble_sort([X], Sorted) :- 
	Sorted = [X].
bubble_sort(Terms, Sorted) :-
	bubble(Terms, Terms), Sorted = Terms ;
	bubble(Terms, Partials), bubble_sort(Partials, Sorted).

bubble([], Bubbled) :- Bubbled = [].
bubble([X], Bubbled) :- Bubbled = [X].
bubble([X,Y|Terms], [Y|Bubbled]) :-
	Y < X, bubble([X|Terms], Bubbled).
bubble([X,Y|Terms], [X|Bubbled]) :-
	X =< Y, bubble([Y|Terms], Bubbled).
	
/* Quick sort */

quicksort([],[]).
quicksort([H|T],X):-
	partition(H,T,Left,Right),
	quicksort(Left,S1),
	quicksort(Right,S2),
	append(S1,[H|S2],X).

partition(_,[],[],[]).
partition(Pivot,[H|T],[H|Rest],RightSide):-
	H =< Pivot,partition(Pivot,T,Rest,RightSide).

partition(Pivot,[H|T],LeftSide,[H|Rest]):-
	H > Pivot,partition(Pivot,T,LeftSide,Rest).

/* Insertion Sort*/

insert(X,[],[X]).
insert(X,[H|T],[X,H|T]):- X =< H,!.
insert(X,[H|T1],[H|T2]):- insert(X,T1,T2).

insort([],[]).
insort([H|T],Sorted):- insort(T,Sorted2), insert(H,Sorted2,Sorted).

/* Selection Sort*/

ssort([],[]).
ssort([M1|S],[H|T]):-min(H,T,M1),remove(M1,[H|T],N),ssort(S,N).

min(M,[],M).
min(M,[H|T],M1):-min2(M,H,N),min(N,T,M1).

min2(A,B,A):-less(A,B).
min2(A,B,B):-not(less(A,B)).

less(A,B):-(A<B).

append([],B,B).
append([H|A],B,[H|AB]):-append(A,B,AB).

remove(X,L,N):-append(A,[X|B],L),append(A,B,N).

/* Merge Sort*/
mergesort([],[]). 
mergesort([A],[A]).
mergesort([A,B|R],S) :- split([A,B|R],L1,L2), mergesort(L1,S1), mergesort(L2,S2), merge(S1,S2,S).

split([],[],[]).
split([A],[A],[]).
split([A,B|R],[A|Ra],[B|Rb]) :-
	split(R,Ra,Rb).

merge(A,[],A).
merge([],B,B).
merge([A|Ra],[B|Rb],[A|M]) :- A =< B, merge(Ra,[B|Rb],M).
merge([A|Ra],[B|Rb],[B|M]) :- A > B, merge([A|Ra],Rb,M).