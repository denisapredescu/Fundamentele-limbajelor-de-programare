% ex 1
% num_aparitii/3

num_aparitii([], _, 0).
num_aparitii([H | T], H, Res) :-
	num_aparitii(T, H, ResReturned),
	Res is ResReturned + 1.
num_aparitii([_ | T], X, Res) :-
	num_aparitii(T, X, Res).

% ex 2
% lista cifre/2

lista_cifre(0, []).
lista_cifre(X, Lista) :-
	lista_inversata(Lista, LInversa),
	cifre_egale(X, LInversa).

lista_inversata([],[]).
lista_inversata([H | T], Res) :-
	lista_inversata(T, ResT),
	append(ResT, [H], Res).

cifre_egale(0, []).
cifre_egale(X, [H | T]) :-
	M is X mod 10,
	D is X div 10,
	cifre_egale(D, T),
	M =:= H.

% ex 3
% ?- listpermcirc([1,2,3],L).
% L = [[2, 3, 1], [3, 1, 2], [1, 2, 3]] .
% listpermcirc/2

listpermcirc(X, L) :- 
	perm(X, L, 0).

perm(X, [], N) :-
	length(X, N).
perm([H | T], L, N) :-
	append(T, [H], X),
	NN is N + 1,
	perm(X, List, NN),
	append([X], List, L).

% ex 4

% a)
% elimina/3
% ?- elimina([1,2,4,2,3], 2,L).
% L = [1, 4, 3].

elimina([], _, []).
elimina([H | T], H, L) :-
	elimina(T, H, L).
elimina([H | T], X, [H | L]) :-
	elimina(T, X, L).
	
% multimi/2 care transforma o lista in multime eliminand toate duplicatele.
% ?- multime([1,2,4,2,3,2,1,2,5,3], L).
% L = [1, 2, 4, 3, 5].

multime([], []).
multime([H | T], [H | L]) :-
	multime(T, L),
	not(member(H, T)).

multime([H | T], L) :-
	multime(T, L),
	member(H, T).


% emult/1 verifica daca o lista este multime
% ?- emult([1,2,4,2,3,2,1,2,5,3]).
% false
% ?- emult([1, 2, 4, 3, 5]).
% true

emult(L) :-
	multime(L, LR),
	length(L, N1),
	length(LR, N2),
	N1 =:= N2.

% ex 5
% 1. inters/3 - intersectia;
% ?- inters([1,2,3,4,5,6,7,8,9], [2,4,6,10,3,11,14], L).
% L = [2, 3, 4, 6].

inters([], _, []).
inters([H | L1], L2, [H | L]) :-
	member(H, L2),
	inters(L1, L2, L).
inters([H | L1], L2, L) :-
	not(member(H, L2)),
	inters(L1, L2, L).

% 2. diff/3 - diferenta;
% ?- diff([1,2,3,4,5,6,7,8,9], [2,4,6,10,3,11,14],L).
% L = [1, 5, 7, 8, 9] .	

diff([], _, []).
diff([H | L1], L2, [H | L]) :-
	not(member(H, L2)),
	diff(L1, L2, L).
diff([H | L1], L2, L) :-
	member(H, L2),
	diff(L1, L2, L).

% 3. prod_cartezian/3 - produsul cartezian.
% ?- prod_cartezian([1,2,3],[4,5,6],L).
% L = [(1, 4), (1, 5), (1, 6), (2, 4), (2, 5), (2, 6), (3, 4), (3, 5), (3, 6)] .

prod_cartezian([], _, []).
prod_cartezian([H | L1], L2, L) :-
	tupluri(H, L2, NewList),
	prod_cartezian(L1, L2, LR),
	append(NewList, LR, L).

tupluri(_, [], []).
tupluri(X, [H | T], [(X, H) | L]) :-
	tupluri(X, T, L).

% ex 6
% a) srd/2 -inordine; rsd/2 - preordine  ̧si sdr/2 - postordine.

srd(nil, []).
srd(arb(R, S, D), L) :-
	srd(S, L1),
	srd(D, L2),
	append(L1, [R], LTemp),
	append(LTemp, L2, L).

rsd(nil, []).
rsd(arb(R, S, D), L) :-
	rsd(S, L1),
	rsd(D, L2),
	append([R | L1], L2, L).

sdr(nil, []).
sdr(arb(R, S, D), L) :-
	sdr(S, L1),
	sdr(D, L2),
	append(L1, L2, LTemp),
	append(LTemp, [R], L).

% b)  frunze/2 care determina lista de frunze pentru un arbore binar dat ca parametru.

frunze(arb(R, nil, nil), [R]).
frunze(nil, []).
frunze(arb(_, S, D), L) :-
	frunze(S, L1),
	frunze(D, L2),
	append(L1, L2, L).
	
		