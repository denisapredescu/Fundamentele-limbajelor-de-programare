%female/1, 
%male/1, 
%parent/1,
%father_of/2
%mother_of/2
%grandfather_of/2
%grandmother_of/2
%sister_of/2
%brother_of/2
%aunt_of/2
%uncle_of/2

female(mary).
female(sandra).
female(juliet).
female(lisa).

male(peter).
male(paul).
male(dony).
male(bob).
male(harry).

parent(bob, lisa).
parent(bob, paul).
parent(bob, mary).
parent(juliet, lisa).
parent(juliet, paul).
parent(juliet, mary).
parent(peter, harry).
parent(lisa, harry).
parent(mary, dony).
parent(mary, sandra).


father_of(F, C) :- parent(F, C), male(F).
mother_of(M, C) :- parent(M, C), female(M).
grandfather_of(G, C) :- father_of(G, P), parent(P, C).
grandmother_of(G, C) :- mother_of(G, P), parent(P, C).
sister_of(S, P) :- parent(X, P), parent(X, S), female(S), S\=P.
brother_of(B, P) :- parent(X, P), parent(X, B), male(B), B\=P.
aunt_of(A, C) :- sister_of(A, P), parent(P, C).
uncle_of(U, C) :- brother_of(U, P), parent(P, C).

