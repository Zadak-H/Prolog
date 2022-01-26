/* Define the prolog predicate split(Numbers, Positives, Negatives) which splits a list of numbers into two lists using cut.*/

split_list([],[],[]).
split_list([H|T],[H|Pos],Neg):- H>= 0, !, split_list(T,Pos,Neg).
split_list([H|T],Pos,[H|Neg]):- split_list(T,Pos,Neg).