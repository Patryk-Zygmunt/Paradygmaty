rodzic(kasia,robert).
rodzic(tomek,robert).
rodzic(tomek,eliza).
rodzic(robert,anna).
rodzic(robert,magda).
rodzic(magda,jan).
 
kobieta(kasia).
kobieta(eliza).
kobieta(magda).
kobieta(anna).
 
mezczyzna(tomek).
mezczyzna(robert).
mezczyzna(jan).

matka(X,Y) :-
	rodzic(X,Y),
	kobieta(X).
 
ojciec(X,Y) :-
	rodzic(X,Y),
	mezczyzna(X).
    
brat(S,B):-
    rodzic(R,S),
    rodzic(R,B),
    B\=S,
    mezczyzna(S).
    
dziadek(D,S):-
    rodzic(R,S),
    rodzic(D,R),
    mezczyzna(D).
    
potomek(P,S):-
    rodzic(S,P).
    
potomek(P,S):-
    rodzic(S,X),
    potomek(P,X).
    