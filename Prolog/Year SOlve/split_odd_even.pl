/* Write a prolog program to split a list into two different lists named Odd and Even
where the Odd list contains elements of odd positions and the Even list contains elements of even positions.*/

split(List,Odd,Even):-odd(List,Odd,Even).

odd([H|T],[H|Odd],Even):-even(T,Odd,Even).
odd([],[],[]).

even([H|T],Odd,[H|Even]):-odd(T,Odd,Even).       
even([],[],[]).