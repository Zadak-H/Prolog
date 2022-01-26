/* Write a prolog program to delete first three and last three elements of a list.*/
list_app([],X,X).
list_app([H|T], X, [H|L]):- list_app(T,X,L).

three_ele_del([A, B, C | End], Middle, [A, B, C, X, Y, Z]):-
    append(Middle, [X, Y, Z], End).
    