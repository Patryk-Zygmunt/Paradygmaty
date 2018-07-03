
delta(A,B,C,W):-
    W is B*B - 4* A*C.
    
kw1(A,B,C,W):-
    delta(A,B,C,X),
    R is sqrt(X),
    W is (-B - R)/(2*A).
kw2(A,B,C,W):-
    delta(A,B,C,X),
    R is sqrt(X),
    W is (-B + R)/(2*A).    

fact(0,1)ą2.
fact(N,W):-
    N > 0 ,
    NN is N - 1,
    fact(NN,NW),
    write(NW),nl,
    W is N * NW.





/*
 * family.pl
 * taken from Bratko, 3rd ed, ch.1, p.17
 *
 */

:- dynamic(kobieta/1).

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

potomek(X,Y) :-
	rodzic(Y,X).

matka(X,Y) :-
	rodzic(X,Y),
	kobieta(X).

ojciec(X,Y) :-
	rodzic(X,Y),
	mezczyzna(X).

dziadkowie(X,Y) :-
	rodzic(X,Z),
	rodzic(Z,Y).

dziadek(X,Y) :-
	dziadkowie(X,Y),
	mezczyzna(X).

babcia(X,Y) :-
	dziadkowie(X,Y),
	kobieta(X).

siostra(X,Y) :-
	rodzic(Z,X),
	rodzic(Z,Y),
	kobieta(X),
	X \= Y.

brat(X,Y) :-
	rodzic(Z,X),
	rodzic(Z,Y),
	mezczyzna(X),
	X \= Y.

przodek(X,Y) :-
	rodzic(X,Y).

przodek(X,Z) :-
	rodzic(X,Y),
	przodek(Y,Z).

%%
madziecko(X) :-
	rodzic(X,_).

				% 2 razy robert? unique?

%% ex 1.3
szczesciarz(X) :-
	madziecko(X).

dwojedzieci(X) :-
	rodzic(X,Y),
	siostra(_,Y).

%% ex 1.4
wnuk(X,Z) :-
	rodzic(Y,X),
	rodzic(Z,Y).

%% ex 1.5
ciocia(X,Y) :-
	rodzic(Z,Y),
	siostra(X,Z).