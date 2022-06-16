%fibonacci

% Varianta de la laborator
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


% Varianta care functioneaza pe valori mari date lui N
% In loc sa merg descrescator pentru a calcula valoarea Res, am ales
% sa determin primii (N+2) termeni a sirului -> al N lea termen este in 
% variabila X (Asa determin o singura data fiecare termen). 
% stim ca F(0) = 1; F(1) = 1; 
 
%fibonacci/2
%fibonacci(+N, -Res)
%fibo/6
%fibo(+N, +Nr, +X, +Y, +Z, -R)

fibo(N, N, X, _, _, R):- R is X.
fibo(N, Nr, _, Y, Z, R):-
	Nr1 is Nr + 1,
	X1 is Y, 
	Y1 is Z, 
	Z1 is X1 + Y1,
	fibo(N, Nr1, X1, Y1, Z1, R).

fibonacci(N, R):- fibo(N, 0, 1, 1, 2, R).