sil(1,0).
sil(W,C):-    
    C >0,
     Cw is C - 1,
    sil(Wy,Cw),
    W is Wy * C.


b(1).
b(2).
c(2).
c(3).
 
a(X) :- b(X), !, c(X).
a(X) :- c(X).   

%us(S,[ ])
us(S,[S|L],R):-us(S,L,R).
us(S,[X|L],[X|R]):-us(S,L,R).


bet(N, M, K) :- N =< M, K = N. 
bet(N, M, K) :- N < M, N1 is N+1, bet(N1, M, K).
   
data(0,L):- !.
data(N,L):-
          random(1,N,R),
         L>0, 
          assert(num(R)),
          LL is L - 1,write(R),write(' '),write(LL),
          data(N,LL).                                                        

przes([X|L],W):-prze(L,X,W).

prze([],X,[X]).
prze([X|L],P,[X|W]):-prze(L,P,W).   

podziel(E,F,W):-append(E,F,W),length(E,L),length(F,Ld),L == Ld.

krt([],_,[]).
krt([X|L],R,[M|W]):-krt(L,[X|R],W),write(R),nl,append(R,L,WW),mm(X,WW,M).

kart([],_,[]).
kart([X|P],D,[M|W]):- kart(P,D,W),mm(X,D,M).

mm(_,[],[]):-!.
mm(X,[R|D],[[X,R]|M]):-mm(X,D,M).   
          
fib(0,1,1).        
fib(1,1,1).
fib(N,W,P):-
    NN is N - 1,
    fib(NN,Wy,PP),
    P  = Wy,
    W is Wy + PP.    

dlugosc([],0).
dlugosc([_|Ogon],Dlug) :-
	dlugosc(Ogon,X),
	Dlug is X+1. 

push(S,T,[T|S]).
push([T|S],T,S).
    
% count(Min,Max,N):-findall(X,num(X),L),len(Min,Max,L,S)N =  


dl(_,_,[],0):- write('erer').
dl(Min,Max,[X|L],N):- Max > X,Min < X,write(X),dl(Min,Max,L,NN)
,N is NN + 1.
dl(Min,Max,[X|L],N):- dl(Min,Max,L,N).
       
     

%len(_,_,[],[]).
%len(Min,Max,[X|L],[X|S]):- Max>X,Min<X,len(Min,Max,L,S). 
%len(Min,Max,[X|L],S):-len(Min,Max,L,S).

  
best(B):-findall(X,num(X),L),max_list(L,B).

bb(M,T):- num(X),X>T,!,bb(X,X).
bb(M,T):- num(X),X<T,!,bb(T,T).

mr(A,B,C):- A>B,C=A.
mr(A,B,C):- A<B,C=B.