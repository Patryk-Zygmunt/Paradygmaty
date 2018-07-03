porwn([_,_,A,B]):-
        A==B.
              
nalezy([A|_],A).
nalezy([_|L],X):-
       nalezy(L,X).
       
dlug([],0).
dlug([_|L],X):-
      dlug(L,XX),      
      X is XX + 1.
      
sklej([],X,X).
sklej([X|L1],L2,[X|L3]) :-
	sklej(L1,L2,L3).

    
ost([X],X):-!.
ost([_|L],X):-
         ost(L,X).

osts(L,X):-
     sklej(_,[X],L).

     
usun(X,[X|Reszta],Reszta).
usun(X,[Y|Ogon],[Y|Reszta]) :-
	usun(X,Ogon,Reszta).
    
    
zawiera(S,L) :-
	sklej(_,L2,L),
	sklej(S,_,L2).
          
us3(L,A):-
      sklej(A,[_,_,_],L).
uspo(L,X):-
       sklej([_,_,_|X],[_,_,_],L),!.
       
       
parz([]).
parz([_,_|L]):-
     parz(L).
 
dodaj(X,L,[X|L]). 


wstaw(A,L,X):-
      usun(A,X,L).
      
%przes(L,X):-
      
     
przel([],[]).
przel([A|L],[Y|X]):-
       znaczy(A,Y),
       przel(L,X).
   
     
     
     
     
     
     
     
  znaczy(0,zero).   znaczy(1,jeden).
      znaczy(2,dwa).    znaczy(3,trzy).
      znaczy(4,cztery). znaczy(5,piec).
      znaczy(6,szesc).  znaczy(7,siedem).
      znaczy(8,osiem).  znaczy(9,dziewiec).    
     
     
     
     
     
     
     
     
     
     
     
     
     
 
     
     
