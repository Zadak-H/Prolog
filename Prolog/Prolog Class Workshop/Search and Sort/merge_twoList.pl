/*Merge two sorted list*/

merge([],[],[]).
merge([A],[],[A]).
merge([],[B],[B]).
merge([H1|L1],[H2|L2],[H1|L]):-
	H1 =< H2, merge(L1,[H2|L2],L).
merge([H1|L1],[H2|L2],[H2|L]):-
	H1 > H2, merge([H1|L1],L2,L).