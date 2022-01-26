max(A,B,M) :- A>B, M is A.
max(A,B,M) :- B>=A, M is B.

min(A,B,M) :- A<B, M is A.
min(A,B,M) :- B=<A, M is B.

max(A,B,C,M) :- A>B, A>C, M is A.
max(A,B,C,M) :- B>=A, B>C, M is B.
max(A,B,C,M) :- C>=A, C>=B, M is C.

min(A,B,C,M) :- A<B, A<C, M is A.
min(A,B,C,M) :- B=<A, B<C, M is B.
min(A,B,C,M) :- C=<A, C<=B, M is C.


