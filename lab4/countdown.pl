:-include('words.pl').

cover([], _).
cover([H|T], L) :-
	select(H, L, R),
	cover(T, R).

solution(ListLetters, Word, Score) :-
	word(Word),
	atom_chars(Word, Letters),
	length(Letters, Score),
	cover(Letters, ListLetters).

search_solution(_, 'no solution', 0).
search_solution(ListLetters, Word, Score) :-
	solution(ListLetters, Word, Score).
search_solution(ListLetters, Word, Score) :-
	NewScore is Score - 1,
	search_solution(ListLetters, Word, NewScore).

topsolution(ListLetters, Word) :-
	length(ListLetters, Score),
	search_solution(ListLetters, Word, Score).

%topsolution([y,c,a,l,b,e,o,s,x], X).