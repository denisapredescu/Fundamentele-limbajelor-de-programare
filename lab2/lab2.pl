%fibonacci
%fib/2
%fib(+N, -Res)

fib(0, 1).
fib(1, 1).
fib(N, Res) :- 
	N1 is N - 1,
	N2 is N - 2,
	fib(N1, Res1),
	fib(N2, Res2),
	Res is Res1 + Res2.


% Se creeaza o matrice de dimensiunea N*N umpluta cu caracterul dat.
% square/2
% squareAux/4
% Pun cazurile functiei in ordinea in care vrem sa fie verificare!

% Am ajuns la finalul matricei.
squareAux(N, N, N, Ch) :- write(Ch).

% Caz in care se termina o linie de scris si trebuie sa trecem pe urmatorul rand
% nl = newline
squareAux(N, I, N, Ch) :-
		write(Ch),
		nl,     
		I1 is I + 1,
		squareAux(N, I1, 1, Ch).

% Caz general
squareAux(N, I, J, Ch) :-
		write(Ch),
		J1 is J + 1,
		squareAux(N, I, J1, Ch).
 
% aceasta este functia apelata in prolog => ii dau pozitia in matrice
square(N, Ch) :- squareAux(N, 1, 1, Ch). 


% Liste 
% Implementare pentru element_of
% element_of/2
% element_of(+Elem, +List).

element_of(H, [H|_]).
element_of(H, [_|T]) :- element_of(H, T).


% concatenare listelor
% concat_lists/3
% concat_lists(+L1, +L2, -LR).
% se creeaza lista concatenata in L3. => L3 este L1 ++ L2 

concat_lists([], L, L).
concat_lists([Elem | L1], L2, [Elem | L3]) :- concat_lists(L1, L2, L3).


% toate elementele din lista sunt a
% all_a/1

all_a([a]).
all_a([a|T]) :- all_a(T).


% trans_a_b/2
% trans_a_b transforma o lista de a-uri intr-o lista de b-uri.

trans_a_b([a], [b]).
trans_a_b([a | T1], [b | T2]) :- trans_a_b(T1, T2).


% Inmultirea unui numar cu un vector
% ScalarMult/3
% ScalarMult(+Scalar, +ListaInput, -ListaOutput).

scalarMult(_, [], []).
scalarMult(Scalar, [HI | TI], [HO | TO]) :-
		HO is HI * Scalar,
		scalarMult(Scalar, TI, TO).

% Produs scalar => inmultesc 2 vectori
% dot/3
% dot(+List1, +List2, -Res).

dot([], [], 0).
dot([H1 | T1], [H2 | T2], Res) :-
		dot(T1, T2, ResTail),
		Res is ResTail + H1 * H2.


% Determinarea maximului dintr-o lista
% max/2
% max(+List, -Max).

max([], 0).
max([X], X).
max([H | T], Max) :- 
	max(T, TailMax),
	H > TailMax,
	Max = H.
max([H | T], Max) :- 
	max(T, TailMax),
	H =< TailMax,
	Max = TailMax.

% Palindrom
% palindrom/1
% reverse_of/2
% reverse_of(+List, -ListInversata).

reverse_of([], L, L).
reverse_of([H | T], ListTemp, ListRest) :- 
		reverse_of(T, [H | ListTemp], ListRest).
reverse_of(L, LR) :- reverse_of(L, [], LR).
palindrom(X) :- reverse_of(X, X).


% Pastreaza o singura aparitie a elementelor in lista.
% remove_duplicates/2
% remove_duplicates(+LI, -LO).
%member - DACA H ESTE MEMBRU AL LUI TAIL, ADICA DACA MAI APARE IN RESTUL LISTEI

remove_duplicates([], []).
remove_duplicates([H | T], Res) :-
	member(H, T),    
	remove_duplicates(T, Res).
remove_duplicates([H | T], [H | TailRes]) :-
	not(member(H, T)),
	remove_duplicates(T, TailRes).


% Inlocuieste fiecare aparitie a lui Ch1 din lista cu Ch2
% replace/4
% replace(+List, +Ch1, +Ch2, -Res).

replace([], _, _, []).
replace([H | T], H, Ch2, [Ch2 | Res]) :-
		 replace(T, H, Ch2, Res).
replace([H | T], Ch1, Ch2, [H | Res]) :- 
		 replace(T, Ch1, Ch2, Res).





