/*Write a Prolog programto find whether a list is a palindrome or not.*/

palindrome([]).
palindrome([_]).
palindrome(L) :-
    append([H|T], [H], L),
    palindrome(T).