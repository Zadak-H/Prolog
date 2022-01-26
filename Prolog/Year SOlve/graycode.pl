
gray_alt(1,['0','1']).
gray_alt(N,C) :- N > 1, N1 is N-1,
   gray_alt(N1,C1), 
   postpend(['0','1'],C1,C).   

postpend(_,[],[]).
postpend(P,[C|Cs],[C1P,C2P|CsP]) :- P = [P1,P2],
   atom_concat(C,P1,C1P), 
   atom_concat(C,P2,C2P),
   reverse(P,PR),
   postpend(PR,Cs,CsP).
