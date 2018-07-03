sklej([],X,X).
sklej([X|L1],L2,[X|L3]) :-
	sklej(L1,L2,L3).
    
us3o(L,U):-
    sklej(U,[_,_,_],L).
    
us3p(L,U):-
    sklej([_,_,_],U,L).

us3po(L,U):-
    sklej([_,_,_|U],[_,_,_],L).
    
parzysta([]).
parzysta([_|L]):-
    parzysta(L).
    
rev([H|T],A,R) :- rev(T,[H|A],R).
rev([],A,A).    
    
palindrom(L,P):-
    rev(L,[],R),sklej(L,R,P).
  
  
  
przesun([X|L],P):-
    sklej(L,X,P).
    
przeloz([],[]).    
przeloz([X|L],[T|R]):-
    znaczy(X,T),
    przeloz(L,R).
    
    
    
    
      znaczy(0,zero).   znaczy(1,jeden).
      znaczy(2,dwa).    znaczy(3,trzy).
      znaczy(4,cztery). znaczy(5,piec).
      znaczy(6,szesc).  znaczy(7,siedem).
      znaczy(8,osiem).  znaczy(9,dziewiec).