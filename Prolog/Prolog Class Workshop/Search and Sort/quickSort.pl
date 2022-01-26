/* Quick sort */

/* You need two methods for this one.
	One that splits the list into two depending on the pivot.
	One that does the actual quick sort. */

/*Algorithm:
	The head of the list is used as the pivot.
	The list is then partitioned to the left and right.
	The left and right lists are then quicksorted.
	The quicksorted lists are then appended accordingly.
	[H] is added due to it having been excluded as the pivot. */

/* Algorithm:
	If the head of the list is smaller or equal to the pivot,
	Then add the head to the left side, and continue partitioning.
	If it isn't,
	Then add the head to the right side, and continue partitioning.
	If the list is empty,
	Then the left and right sides of the list are both empty as well */
	
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
