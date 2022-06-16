% TEMA: (x*y)*z = u*(u)^(-1)
% Sa se gaseasca un unificator pentru termenii (x*y)*z = u*(u)^(-1).
% Solutie:
% *(*(x,y), z) = *(u, u^(-1))
% Lista solutiei                    Lista de rezolvat                    Operatie
% multimea vida			  (x * y) * z = u * (u)^(-1)             DESCOMPUNE
% multimea vida	                  x * y = u; z = u^(-1)		  	 REZOLVA
% u = x * y                       z = (x * y)^(-1)                       REZOLVA
% u = x * y; z = (x * y)^(-1)	     multimea vida                       FINAL

% exista unificatorul { x * y / u, (x * y)^(-1) / z}		



% ex 1
word(abalone, a,b,a,l,o,n,e).
word(abandon, a,b,a,n,d,o,n).
word(anagram, a,n,a,g,r,a,m).
word(connect, c,o,n,n,e,c,t).
word(elegant, e,l,e,g,a,n,t).
word(enhance, e,n,h,a,n,c,e).


crossword(V1, V2, V3, H1, H2, H3) :-
    word(V1, _, A, _, B, _, C, _),
    word(V2, _, D, _, E, _, F, _),
    word(V3, _, G, _, H, _, I, _),
    word(H1, _, A, _, D, _, G, _),
    word(H2, _, B, _, E, _, H, _),
    word(H3, _, C, _, F, _, I, _). 


% ex 2
born(jan, date(20,3,1977)).
born(jeroen, date(2,2,1992)).
born(joris, date(17,3,1995)).
born(jelle, date(1,1,2004)).
born(joan, date(24,12,0)).
born(joop, date(30,4,1989)).
born(jannecke, date(17,3,1993)).
born(jaap, date(16,11,1995)).

% date(Day, Month, Year)

% year/2
% year(+ Year, -Person).

year(Year, Person ) :- 
	born(Person, date(_, _, Year)).

% before/2

before(date(D1, M1, Y1), date(D2, M2, Y2)):-
	Y1 < Y2 ;
	Y1 =:= Y2, M1 < M2;
	Y1 =:= Y2, M1 =:= M2, D1 < D2.

% older / 2

older(X, Y) :-
	born(X, DateX),
	born(Y, DateY),
	before(DateX, DateY).

% born(X, DateX) => in DateX imi zice data in care este nascut X



% Maze - ex 3

% connected(1,2).
% connected(3,4).
% connected(5,6).
% connected(7,8).
% connected(9,10).
% connected(12,13).
% connected(13,14).
% connected(15,16).
% connected(17,18).
% connected(19,20).
% connected(4,1).
% connected(6,3).
% connected(4,7).
% connected(6,11).
% connected(14,9).
% connected(11,15).
% connected(16,12).
% connected(14,17).
% connected(16,19).

connected(1,2).
connected(2,1).
connected(1,3).
connected(3,4).

% path / 2
% path(X, Y) - true daca exista un drum de la X la Y.

% path(X, Y) :- connected(X, Y).
% path(X, Y) :- connected(X, Z), path(Z, Y).


% ?- path(5, 10).
% true .

% ?- path(1, X).
% X = 2 .

% ?- path(X, 13).
% X = 12 ;
% X = 5 ;
% X = 15 ;
% X = 6 ;
% X = 11 ;
% X = 16 ;
% false.


% nu merge in cazul in care avem cicluri.

% tema: solutia pt a elimina ciclurile este sa avem o lista de noduri vizitate

% path(X, Y, ListaElemVizitate). 
path(X, Y, V) :- not(member(X, V)), connected(X, Z), path(Z, Y, [X | V]).
path(X, Y, _):- connected(X, Y).
path(X, Y) :- path(X, Y, []).



% Ex 4 - reprezentarea numerelor naturale ca liste.
% 0 = [], 1 = [x] , 2 = [x, x]

succesor(L, [x | L]).

plus(L1, L2, LR) :- 
	append(L1, L2, LR).

times([], _, []).
times([x | T], L2, LR) :-
	times(T, L2, ListTail),
	plus(L2, ListTail, LR). 


% element_at/3
% element_at(+List, _Index, -ElemDePeIndex).

element_at([H|_], 0, H).
element_at([_|T], Index, Result) :-
	NewIndex is Index - 1,
	element_at(T, NewIndex, Result).



% mutantii

animal(alligator). 
animal(tortue) .
animal(caribou).
animal (ours) .
animal(cheval) .
animal(vache) .
animal(lapin) .

%  mutant/1

mutant(X) :- 
	animal(Y),
	animal(Z),
	Y \= Z,
	name(Y, Ly),
	name(Z, Lz),
	append(Y1, Y2, Ly),
	append(Y2, _, Lz),
	Y2 \= [],
	append(Y1, Lz, Lx),
	name(X, Lx).

% exista o factorizare a listei Ly, Y1 ++ Y2 = Ly.
% exista o factorizare a listei Lz, Y2 ++ _ = Lz.
			 