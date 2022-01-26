/* between( Nl, N2, X) which, for two given integers Nl and N2, generates through backtracking all the integers X that satisfy the constraint N1 S X S N2.*/

between(N1, N2,N1).
between(N1,N2,X) :- X1 is N1+1, X1 =< N2, between(X1, N2,X).