add_up_list(L,K) :- aux(L,K,0).
   aux([],[],_).
   aux([X|L],[Y|K],Z) :- Y is Z+X, aux(L,K,Y).