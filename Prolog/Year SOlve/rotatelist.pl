/* Write prolog predicate(s) to rotate a list N places to the left.*/
list_app([],X,X).
list_app([H|T], X, [H|L]):- list_app(T,X,L).

rotate_left( [], [] ) .
rotate_left( [L|Ls] , Rotated ) :-  list_app( Ls , [L] , Rotated ).

rotate_left_to_N(R,0,_):- write(R),!.
rotate_left_to_N(L1,X,R):- Y is X - 1, rotate_left(L1,Rem), rotate_left_to_N(Rem,Y,R).