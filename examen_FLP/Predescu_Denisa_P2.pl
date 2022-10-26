% P ::  prog n [E, E, ... E]
% E :: mem | n | E + E 

prog(N, ListaE) :- smallstepP(N, ListaE, ListaRezultat),
                    afisare_lista(ListaRezultat).

afisare_lista([]).                    
afisare_lista([H | T]) :- write(H), nl, afisare_lista(T).
                    
smallstepP(_, [], []).
smallstepP(N, [E | ListaE], [RezutatCurent | ListaRez]) :-
           smallstepP(N, ListaE, ListaRez),
           smallstepE(N, E, RezutatCurent).


smallstepE(N, mem, N).  % daca ni se cere "mem" adica starea memoriei, ii returnam ca rezultat N

smallstepE(N, NR, NR) :- N is NR.  % daca E = n presupun ca n este folosit in  E + E (pentru ca E trebuie fie calculabil) 
                                    % daca totusi nu este folosit pentr E + E, va returna in memorie valoarea numarului, pentru ca este ultima intalnita
smallstepE(Rezultat, E + E , Rezultat) :- 
              smallstepE(_, E, Intreg1),
              smallstepE(_, E, Intreg2),
              Rezultat is Intreg1 + Intreg2. 
              
% la ultimul predicat am pus N = Rezultat pentru ca ni se zice ca valoarea memoriei (aka N) 
% este rezultatul ultimei expresii (in cazul acesta E + E) 
             
      