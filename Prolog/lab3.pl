por34([_,_,C,C|_]).
zam34([J,D,T,C|L],[J,D,C,T|L]).

nalezy(X,[X|_]).
nalezy(X,[_|Yogon]) :-
	nalezy(X,Yogon).
    
dlug([],0).
dlug([_|L],N):-
    dlug(L,NN),
    N is NN + 1.

sklej([],X,X).
sklej([X|L1],L2,[X|L3]) :-
	sklej(L1,L2,L3).
    
ostatni(E,[E]).
ostatni(E,[_|L]):-ostatni(E,L).

osts(E,L):-sklej(_,[E],L).

dodaj(X,L,[X|L]).


usun(E,[E|R],R).
usun(E,[X|T],[X|L]):-
    usun(E,T,L).


wstaw(X,L,Duza) :-
	usun(X,Duza,L).
    
accRev([H|T],A,R) :- accRev(T,[H|A],R).
accRev([],A,A).

permutacja([],[]).
permutacja([X|L],P) :-
	permutacja(L,L1),
	wstaw(X,L1,P).
 