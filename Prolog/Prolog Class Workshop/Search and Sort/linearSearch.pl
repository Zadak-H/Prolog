/*Write a program in prolog for Linear Search*/

lsearch([],_):- write("Item not Found").
lsearch([key|_],key):- write("Item was Found").
lsearch([_|T],key):- lsearch(T,key).